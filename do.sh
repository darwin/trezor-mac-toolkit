#!/usr/bin/env bash

set -e -o pipefail

echo_cmd() {
  echo "(in $(pwd)) $ $@"
  "$@"
}

# ---------------------------------------------------------------------------------------------------------------------------

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ "$1" == "build_unix" ]]; then
  shift
  cd repos/trezor-core
  echo_cmd make build_unix "$@"
  exit $?
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
