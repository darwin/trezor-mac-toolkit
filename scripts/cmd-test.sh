#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

PYTHONPATH=${PYTHONPATH}

cd "$TREZOR_CORE_DIR"

fail_if_micropython_not_present

if [[ "$1" == "unit" || -z $1 ]]; then
  pipenv run make test
fi

if [[ "$1" == "device" || -z $1 ]]; then
  # https://github.com/trezor/python-trezor#building-from-source
  cd "$PYTHON_TREZOR_DIR"
  python3 setup.py develop
  cd "$TREZOR_CORE_DIR"
  pipenv run make test_emu
fi

if [[ "$1" == "coverage" ]]; then
  cd tests
  ./check_coverage.sh
fi
