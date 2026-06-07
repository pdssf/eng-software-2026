from enum import Enum

class State(Enum):
  OUTSIDE_OPENING_TAG = 1
  INSIDE_OPENING_TAG = 2


def parse_opening_tag(content, index):
  tag_name = ""
  while index < len(content) and not content[index].isspace() and content[index] != '/' and content[index] != '>':
    tag_name += content[index]
    index += 1

  attributes = {}
  while index < len(content) and content[index] != '/' and content[index] != '>':
    while index < len(content) and content[index].isspace():
      index += 1

    if content[index] != '/' and content[index] != '>':
      attribute_name = ""
      while index < len(content) and content[index] != '=':
        attribute_name += content[index]
        index += 1

      index += 2

      attribute_value = ""
      while index < len(content) and content[index] != '"':
        attribute_value += content[index]
        index += 1

      index += 1
      attributes[attribute_name] = attribute_value

  self_closing = content[index] == '/'
  if self_closing:
    index += 2
  else:
    index += 1

  return tag_name, attributes, self_closing, index


def consume_closing_tag(content, index):
  while index < len(content) and content[index] != '>':
    index += 1

  index += 1
  return index


def parse_xml(content, index = 0, state = State.OUTSIDE_OPENING_TAG):
  parsed = []
  while index < len(content):
    if state == State.OUTSIDE_OPENING_TAG:
      while index < len(content) and content[index] != '<':
        index += 1

      if index >= len(content):
        continue

      index += 1
      if content[index] == '/':
        new_index = consume_closing_tag(content, index)
        return parsed, new_index

      parsed_tag, new_index = parse_xml(content, index, State.INSIDE_OPENING_TAG)
      parsed.append(parsed_tag[0])      
      index = new_index
    elif state == State.INSIDE_OPENING_TAG:
      tag_name, attributes, self_closing, new_index = parse_opening_tag(content, index)
      parsed_tag = { "name": tag_name, "attributes": attributes }

      if not self_closing:
        parsed_children, new_index = parse_xml(content, new_index, State.OUTSIDE_OPENING_TAG)
        parsed_tag["children"] = parsed_children

      parsed.append(parsed_tag)
      return parsed, new_index

  return parsed, index


def parse_xml_file(filename):
  with open(filename, "r") as f:
    content = f.read()

  lines = content.splitlines()
  content = "\n".join(lines[1:])

  index = 0
  parsed = []

  while index < len(content):
    nparsed, nindex = parse_xml(content, index)
    for tag in nparsed:
      parsed.append(tag)

    index = nindex

  return parsed


def extract_bug_properties(bug_instance):
  bug = bug_instance["attributes"]
  children = bug_instance["children"]

  cclass = next((tag for tag in children if tag["name"] == "Class"), None)
  method = next((tag for tag in children if tag["name"] == "Method"), None)
  field = next((tag for tag in children if tag["name"] == "Field"), None)

  if cclass != None:
    bug["class"] = cclass["attributes"]["classname"]

  if method != None:
    bug["method"] = method["attributes"]["name"]

  if field != None:
    bug["field"] = field["attributes"]["name"]

  return bug


def get_reported_bugs(filename):
  parsed_xml = parse_xml_file(filename)

  bug_collection_children = parsed_xml[0]["children"]
  bug_instances = [tag for tag in bug_collection_children if tag["name"] == "BugInstance"]

  return [extract_bug_properties(bug_instance) for bug_instance in bug_instances]
