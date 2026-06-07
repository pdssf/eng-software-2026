import os
from parse import get_reported_bugs
from stats import count_bugs, count_in_common
from tables import gen_tables

XML_DIR = "../data"

def get_xml_files():
  xml_files = {}
  projects = os.listdir(XML_DIR)

  for project in projects:
    project_dir = f"{XML_DIR}/{project}"
    all_files = os.listdir(project_dir)
    xml_files[project] = sorted([f for f in all_files if f.endswith(".xml")])

  return xml_files


def get_revision_id(filename):
  return filename[:10]


if __name__ == "__main__":
  xml_files = get_xml_files()

  print("Extracting bugs from SpotBugs reports...")

  bugs = {}
  for project, files in xml_files.items():
    bugs[project] = {}
    for file in files:
      filepath = f"{XML_DIR}/{project}/{file}"
      bugs[project][get_revision_id(file)] = get_reported_bugs(filepath)

  print("Extracting statistics from bugs...")

  stats = {}
  for project, pbugs in bugs.items():
    stats[project] = { "counts": {} }
    for revision, pfbugs in pbugs.items():
      stats[project]["counts"][revision] = count_bugs(pfbugs)

    stats[project]["common"] = count_in_common(pbugs)

  print("Generating tables...")

  for project, pstats in stats.items():
    gen_tables(project, pstats)
  
  print("All done")
