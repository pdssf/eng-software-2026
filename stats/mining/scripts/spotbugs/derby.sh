#!/bin/bash

REPO_DIR=$1
OUTPUT_DIR=$(realpath "$2")
SPOTBUGS_BIN=$(realpath $3)

CURRENT_DIR=$(pwd)
COMMITS_FILE="$OUTPUT_DIR/commits.txt"

cd "$REPO_DIR"

CURRENT_BRANCH=$(git branch --show-current)

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk use java 11.0.31-tem

index=1
while IFS= read -r commit; do
  git reset --hard
  git clean -fdx
  git checkout "$commit" </dev/null

  rm -rf classes
  rm -rf classes.pptesting
  rm -rf generated
  rm -rf jars

  if ! ant buildsource </dev/null; then
    echo "Build failed for $commit"
    ((index++))
    continue
  fi

  if [ ! -d ./classes ]; then
    echo "No classes for $commit"
    ((index++))
    continue
  fi

  sdk use java 25.0.3-tem

  OUTPUT_FILE="$OUTPUT_DIR/${index}_${commit}.xml"
  if ! "$SPOTBUGS_BIN" -textui -auxclasspath "./jars" -xml="$OUTPUT_FILE" ./classes/; then
    echo "SpotBugs failed for $commit"
  fi

  if ((index >= 2)); then
    sdk use java 8.0.492-tem
  else
    sdk use java 11.0.31-tem
  fi

  ((index++))
done < "$COMMITS_FILE"

git checkout "$CURRENT_BRANCH"

cd "$CURRENT_DIR"
