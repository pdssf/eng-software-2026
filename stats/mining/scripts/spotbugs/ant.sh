#!/bin/bash

REPO_DIR=$1
OUTPUT_DIR=$(realpath "$2")
SPOTBUGS_BIN=$(realpath $3)

CURRENT_DIR=$(pwd)
COMMITS_FILE="$OUTPUT_DIR/commits.txt"

cd "$REPO_DIR"

CURRENT_BRANCH=$(git branch --show-current)

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk use java 8.0.492-tem

index=1
while IFS= read -r commit; do
  git checkout "$commit"

  if [ ! -f build.sh ]; then
    echo "No build.sh for $commit"
    ((index++))
    continue
  fi

  rm -rf build
  chmod +x build.sh

  if ! sh build.sh; then
    echo "Build failed for $commit"
    ((index++))
    continue
  fi

  if [ ! -d ./build/classes ]; then
    echo "No build/classes for $commit"
    ((index++))
    continue
  fi

  sdk use java 25.0.3-tem

  OUTPUT_FILE="$OUTPUT_DIR/${index}_${commit}.xml"
  if ! "$SPOTBUGS_BIN" -textui -xml="$OUTPUT_FILE" ./build/classes; then
    echo "SpotBugs failed for $commit"
  fi

  sdk use java 8.0.492-tem

  ((index++))
done < "$COMMITS_FILE"

git checkout "$CURRENT_BRANCH"

cd "$CURRENT_DIR"
