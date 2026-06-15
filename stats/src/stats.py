NO_VALUE = "NOVALUE"

def count_bugs_by(bugs, by):
  counts = {}
  for bug in bugs:
    group_id = tuple(bug[p] if p in bug else NO_VALUE for p in by)
    if not group_id in counts:
      counts[group_id] = 0

    counts[group_id] += 1

  return sorted(
    [{ **dict(zip(by, g)), "count": c } for g, c in counts.items()],
    key=lambda r: r["count"],
    reverse=True
  )


def count_bugs(bugs):
  return {
    "type": count_bugs_by(bugs, ["type"]),
    "category": count_bugs_by(bugs, ["category"]),
    "class": count_bugs_by(bugs, ["class"]),
    "method": count_bugs_by(bugs, ["class", "method_name"]),
    "field": count_bugs_by(bugs, ["class", "method_name", "field_name"])
  }


def same_bug_property(b1, b2, prop):
  b1_value = b1[prop] if prop in b1 else None
  b2_value = b2[prop] if prop in b2 else None

  return b1_value == b2_value


def same_bug(b1, b2):
  return (
    same_bug_property(b1, b2, "type")
    and same_bug_property(b1, b2, "class")
    and same_bug_property(b1, b2, "method_name")
    and same_bug_property(b1, b2, "method_signature")
    and same_bug_property(b1, b2, "field_name")
    and same_bug_property(b1, b2, "field_signature")
  )


def count_in_common(project_bugs):
  common = {}
  revisions = list(project_bugs.keys())

  for i in range(len(revisions) - 1):
    common[revisions[i]] = {}
    for j in range(i + 1, len(revisions)):
      ibugs = project_bugs[revisions[i]]
      jbugs = project_bugs[revisions[j]]

      count = 0
      for ibug in ibugs:
        jbug = next((jbug for jbug in jbugs if same_bug(ibug, jbug)), None)
        if jbug != None:
          count += 1

      common[revisions[i]][revisions[j]] = count
  
  return [
    {
      "revision": lr,
      "count": len(project_bugs[lr]),
      **{ rr: common[lr][rr] if rr in common[lr] else "-" for rr in revisions } 
    }
    for lr in revisions[:-1]
  ]
