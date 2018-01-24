#!/usr/bin/env bash

set -e -o pipefail

# ---------------------------------------------------------------------------------------------------------------------------

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ "$1" == "build_unix" ]]; then
  shift
  exec ./scripts/cmd-build-unix.sh "$@"
fi

if [[ "$1" == "emu" ]]; then
  shift
  exec ./scripts/cmd-emu.sh "$@"
fi

if [ $# -eq 0 ]; then
  echo "no arguments provided"
  echo "please provide a command to run, e.g."
  echo "  do.sh fish"
  exit 1
else
  echo "(in $(pwd)) [exec raw command] $ $@"
  exec "$@"
fi
