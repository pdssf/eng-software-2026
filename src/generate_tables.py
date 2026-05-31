import math
import os
from pathlib import Path

LOGS_DIR = "../logs"
TABLES_DIR = "../tables"

PROJECTS_MAP = {
  "cass": "cassandra",
  "lucence": "lucene-solr",
  "mvn": "maven"
}

def get_value(text, pattern):
  start_pos = text.rfind(pattern)
  if start_pos == -1:
    raise Exception("Cannot find value in the text")

  end_pos = text.find("\n", start_pos)

  value = float(text[start_pos:end_pos].replace(pattern, ""))
  if math.isnan(value):
    value = 0

  return value


def get_metrics(filename):
  with open(filename, "r") as f:
    content = f.read()

  auc = get_value(content, "AUC_median")
  precision = get_value(content, "p=")
  recall = get_value(content, "r=")
  f1 = get_value(content, "f=")

  return auc, precision, recall, f1


def get_project(filename, pattern):
  project = filename.replace(pattern, "").replace(".log", "")
  if project in PROJECTS_MAP:
    return PROJECTS_MAP[project]

  return project


def get_all_metrics(files, pattern):
  metrics = {}
  for f in files:
    project = get_project(f, pattern)
    try:
      metrics[project] = get_metrics(f"{LOGS_DIR}/{f}")
    except Exception:
      continue

  return metrics


def get_table_filename(table_name):
  return f"{TABLES_DIR}/{table_name}.csv"


def gen_table(all_files, patterns, table_name, headers, desired_metrics):
  files = { p: [f for f in all_files if f.startswith(p)] for p in patterns }
  metrics = { p: get_all_metrics(files[p], p) for p in patterns }

  projects = metrics[patterns[0]].keys()
  for p in patterns:
    projects = list(set(projects) & set(metrics[p].keys()))

  projects.sort()

  table_filename = get_table_filename(table_name)
  with open(table_filename, "w") as f:
    headers_line = ",".join(headers)
    f.write(f"{headers_line}\n")

    sums = { p: [0, 0, 0, 0] for p in patterns }
    for project in projects:
      values = { p: metrics[p][project] for p in patterns }
      for p in patterns:
        psums = sums[p]
        pvalues = values[p]

        for i in desired_metrics:
          psums[i] += pvalues[i]

        sums[p] = psums

      project_values = [project]
      for i in desired_metrics:
        for p in patterns:
          project_values.append(values[p][i])

      project_line = ",".join(map(str, project_values))
      f.write(f"{project_line}\n")

    num_projects = len(projects)

    avg_values = ["Average"]
    for i in desired_metrics:
      for p in patterns:
        avg_values.append(sums[p][i] / num_projects)

    avg_line = ",".join(map(str, avg_values))
    f.write(f"{avg_line}\n")


def gen_table_3x(all_files, baseline_pattern, dummy_table_name, table_name):
  dummy_pattern = f"dummy_table{dummy_table_name}_"
  desired_metrics = [1, 2, 3, 0]
  headers = [
    "Project",
    "Precision",
    "Precision (dummy)",
    "Recall",
    "Recall (dummy)",
    "F1",
    "F1 (dummy)",
    "AUC",
    "AUC (dummy)"
  ]

  gen_table(all_files, [baseline_pattern, dummy_pattern], table_name, headers, desired_metrics)


def gen_tables_3(all_files):
  gen_table_3x(all_files, "baseline_table3a_", "3b", "3a")
  gen_table_3x(all_files, "baseline_without_leaked_features_table3b_", "3b", "3b")
  gen_table_3x(all_files, "baseline_table3c_", "3c", "3c")
  gen_table_3x(all_files, "baseline_without_leaked_features_table3d_", "3c", "3d")


def gen_table_knn(all_files, k, table_name):
  pattern = f"nn{str(k) if k > 1 else ""}_table4_"
  desired_metrics = [1, 2, 3]
  headers = [
    "Project",
    "Precision",
    "Recall",
    "F1"
  ]

  gen_table(all_files, [pattern], table_name, headers, desired_metrics)


def gen_tables_knn(all_files):
  gen_table_knn(all_files, 1, "nn")
  gen_table_knn(all_files, 3, "nn3")
  gen_table_knn(all_files, 5, "nn5")
  gen_table_knn(all_files, 10, "nn10")


def gen_only_leaked_table(all_files):
  table_name = "only_leaked"
  pattern = "only_leaked_table4_"
  desired_metrics = [1, 2, 3]
  headers = [
    "Project",
    "Precision",
    "Recall",
    "F1"
  ]

  gen_table(all_files, [pattern], table_name, headers, desired_metrics)


def get_metrics_from_table(table_name, desired_metrics):
  table_filename = get_table_filename(table_name)
  with open(table_filename, "r") as f:
    lines = f.read().split("\n")

  headers = lines[0].replace("Project,", "").split(",")
  avg_values = lines[-2].replace("Average,", "").split(",")

  desired_avg_values = []
  for header, avg in zip(headers, avg_values):
    if header in desired_metrics:
      desired_avg_values.append(avg)

  return desired_avg_values


def gen_table_row(table_file, reference_table_name, desired_metrics, row_id):
  metrics = get_metrics_from_table(reference_table_name, desired_metrics)
  row_values = [row_id] + metrics

  row_line = ",".join(row_values)
  table_file.write(f"{row_line}\n")


def gen_table_4():
  table_filename = get_table_filename("4")
  with open(table_filename, "w") as f:
    desired_metrics = ["Precision", "Recall", "F1"]
    headers = ["Technique"] + desired_metrics

    headers_line = ",".join(headers)
    f.write(f"{headers_line}\n")

    gen_table_row(f, "3a", desired_metrics, "Golden Features SVM")
    gen_table_row(f, "3b", desired_metrics, "\t- leaked features")
    gen_table_row(f, "3c", desired_metrics, "\t- data duplication")
    gen_table_row(f, "3d", desired_metrics, "\t- data duplication and leaked features")

    gen_table_row(f, "5a", desired_metrics, "\t+ reimplemented leaked features")

    gen_table_row(f, "nn10", desired_metrics, "Golden Featurs kNN (with k = 10)")
    gen_table_row(f, "nn5", desired_metrics, "Golden Featurs kNN (with k = 5)")
    gen_table_row(f, "nn3", desired_metrics, "Golden Featurs kNN (with k = 3)")
    gen_table_row(f, "nn", desired_metrics, "Golden Featurs kNN (with k = 1)")

    gen_table_row(f, "only_leaked", desired_metrics, "Only leaked features SVM")


def gen_table_5x(all_files, year, table_name):
  baseline_pattern = f"baseline_{year}_"
  dummy_pattern = f"dummy_{year}_"
  desired_metrics = [1, 2, 3, 0]
  headers = [
    "Project",
    "Precision",
    "Precision (dummy)",
    "Recall",
    "Recall (dummy)",
    "F1",
    "F1 (dummy)",
    "AUC",
    "AUC (dummy)"
  ]

  gen_table(all_files, [baseline_pattern, dummy_pattern], table_name, headers, desired_metrics)


def gen_tables_5(all_files):
  gen_table_5x(all_files, "2016", "5a")
  gen_table_5x(all_files, "2017", "5b")
  gen_table_5x(all_files, "2018", "5c")


def gen_table_7x_by_project(all_files, table_id):
  table_name = f"{table_id}_by_project"
  baseline_pattern = f"baseline_table{table_id}_"
  dummy_pattern = f"dummy_table{table_id}_"
  desired_metrics = [3, 0]
  headers = [
    "Project",
    "F1",
    "F1 (dummy)",
    "AUC",
    "AUC (dummy)"
  ]

  gen_table(all_files, [baseline_pattern, dummy_pattern], table_name, headers, desired_metrics)


def gen_tables_7_by_project(all_files):
  gen_table_7x_by_project(all_files, "7a")
  gen_table_7x_by_project(all_files, "7b")
  gen_table_7x_by_project(all_files, "7c")


def gen_table_7():
  table_filename = get_table_filename("7")
  with open(table_filename, "w") as f:
    desired_metrics = ["F1", "F1 (dummy)", "AUC", "AUC (dummy)"]
    headers = ["Dataset"] + desired_metrics

    headers_line = ",".join(headers)
    f.write(f"{headers_line}\n")

    f.write("Original dataset,0.39,0.43,0.54,0.50\n")

    gen_table_row(f, "7a_by_project", desired_metrics, "\t- unconfirmed actionable warnings")
    gen_table_row(f, "7b_by_project", desired_metrics, "Projects using Findbugs")
    gen_table_row(f, "7c_by_project", desired_metrics, "\t- unconfirmed false alarms")


if __name__ == "__main__":
  Path(TABLES_DIR).mkdir(exist_ok = True)
  log_files = os.listdir(LOGS_DIR)

  gen_tables_3(log_files)
  gen_tables_knn(log_files)
  gen_only_leaked_table(log_files)
  gen_tables_5(log_files)
  gen_tables_7_by_project(log_files)

  gen_table_4()
  gen_table_7()
