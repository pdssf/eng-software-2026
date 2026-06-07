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
  git checkout "$commit" </dev/null

  rm -rf target

  if ! mvn compile -DskipTests </dev/null; then
    echo "Build failed for $commit"
    ((index++))
    continue
  fi

  if [ ! -d ./target/classes ]; then
    echo "No target/classes for $commit"
    ((index++))
    continue
  fi

  sdk use java 25.0.3-tem

  OUTPUT_FILE="$OUTPUT_DIR/${index}_${commit}.xml"
  if ! "$SPOTBUGS_BIN" -textui -xml="$OUTPUT_FILE" ./target/classes/; then
    echo "SpotBugs failed for $commit"
  fi

  sdk use java 11.0.31-tem

  ((index++))
done < "$COMMITS_FILE"

git checkout "$CURRENT_BRANCH"

cd "$CURRENT_DIR"
