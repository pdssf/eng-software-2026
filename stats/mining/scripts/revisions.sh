#!/bin/bash

REPO_DIR=$1
OUTPUT_FILE=$(realpath "$2")
CURRENT_DIR=$(pwd)

cd "$REPO_DIR"

CURRENT_BRANCH=$(git branch --show-current)

log_and_goto_next() {
  git log -1 --format=%H >> "$OUTPUT_FILE"

  TARGET_DATE=$(git show -s --format=%cI HEAD)
  CUTOFF=$(date -d "$TARGET_DATE $1 year ago" --iso-8601=seconds)
  NEXT=$(git rev-list HEAD --before="$CUTOFF" --max-count=1)

  git checkout "$NEXT"
}

log_and_goto_next 1
log_and_goto_next 1
log_and_goto_next 2
log_and_goto_next 1
log_and_goto_next 1
log_and_goto_next 1

git checkout "$CURRENT_BRANCH"

cd "$CURRENT_DIR"
