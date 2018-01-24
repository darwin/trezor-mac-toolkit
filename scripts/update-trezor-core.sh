#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$TREZOR_CORE_DIR"

if [[ ! -z $(git status -s) ]]; then
  echo_err "$TREZOR_CORE_DIR is not clean => commit/stash your changes first"
  exit 1
fi

git pull
git submodule update --recursive