#!/usr/bin/env bash

set -e -o pipefail

# ---------------------------------------------------------------------------------------------------------------------------

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ "$1" == "prepare" ]]; then
  cd "repos"
  # https://github.com/trezor/python-trezor#building-from-source
  cd "python-trezor"
  python3 setup.py prebuild
  cd ".."

  # https://github.com/trezor/trezor-core/blob/master/docs/testing.md#1-running-the-suite-with-pipenv
  cd "trezor-core"
  pipenv install --skip-lock

  exit 0
fi

if [[ "$1" == "build_unix" ]]; then
  shift
  exec ./scripts/cmd-build-unix.sh "$@"
fi

if [[ "$1" == "emu" ]]; then
  shift
  exec ./scripts/cmd-emu.sh "$@"
fi

if [[ "$1" == "test" ]]; then
  shift
  exec ./scripts/cmd-test.sh "$@"
fi

if [ $# -eq 0 ]; then
  echo "no arguments provided"
  echo "please provide a command to run, e.g."
  echo "  do.sh bash"
  exit 1
else
  echo "(in $(pwd)) [exec raw command] $ $@"
  exec "$@"
fi
