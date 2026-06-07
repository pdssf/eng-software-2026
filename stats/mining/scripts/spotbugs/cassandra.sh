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

  rm -rf build

  if (( index > 3 )); then
    if ! ant build -Dant.gen-doc.skip=true -Duse.jdk11=true </dev/null; then
      echo "Build failed for $commit"
      ((index++))
      continue
    fi
  else
    if ! ant -Dant.gen-doc.skip=true </dev/null; then
      echo "Build failed for $commit"
      ((index++))
      continue
    fi
  fi

  if [ ! -d ./build/classes ]; then
    echo "No build/classes for $commit"
    ((index++))
    continue
  fi

  sdk use java 25.0.3-tem

  OUTPUT_FILE="$OUTPUT_DIR/${index}_${commit}.xml"
  if ! "$SPOTBUGS_BIN" -textui -auxclasspath "./build/lib/" -xml="$OUTPUT_FILE" ./build/classes/; then
    echo "SpotBugs failed for $commit"
  fi

  sdk use java 11.0.31-tem

  ((index++))
done < "$COMMITS_FILE"

git checkout "$CURRENT_BRANCH"

cd "$CURRENT_DIR"
