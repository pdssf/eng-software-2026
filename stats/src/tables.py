from pathlib import Path

TABLES_DIR = "../tables"

def gen_table(path, rows):
  headers = rows[0].keys()
  headers_line = ",".join(headers)
  rows_lines = [",".join([str(r[h]) for h in headers]) for r in rows]

  csv_content = "\n".join(rows_lines)
  csv_content = f"{headers_line}\n{csv_content}"

  filepath = Path("/".join([TABLES_DIR] + path))
  filepath.parent.mkdir(parents=True, exist_ok=True)

  with filepath.open("w") as f:
    f.write(csv_content)


def gen_tables(project, stats, intermediate_groups = []):
  if isinstance(stats, list):
    path = [project] + intermediate_groups[:-1] + [f"{intermediate_groups[-1]}.csv"]
    gen_table(path, stats)
  else:
    for g, gstats in stats.items():
      gen_tables(project, gstats, intermediate_groups + [g])
