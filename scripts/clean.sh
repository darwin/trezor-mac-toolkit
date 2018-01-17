#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

pushd "$ROOT_DIR"

if [[ -z "$WORK_DIR" ]]; then
  echo_err "WORK_DIR seems to be empty!"
  exit 1
fi

rm -rf "$WORK_DIR/*"

if [[ -z "$REPOS_DIR" ]]; then
  echo_err "REPOS_DIR seems to be empty!"
  exit 1
fi

rm -rf "$REPOS_DIR"/*

popd