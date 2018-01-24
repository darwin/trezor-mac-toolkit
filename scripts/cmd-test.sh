#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

PYTHONPATH=${PYTHONPATH}

cd "$TREZOR_CORE_DIR"

fail_if_micropython_not_present

cd "tests"

if [[ "$1" == "unit" || -z $1 ]]; then
  ./run_tests.sh
fi

if [[ "$1" == "device" || -z $1 ]]; then
  PYTHONPATH="$PYTHON_TREZOR_DIR:${PYTHONPATH}" ./run_tests_device_emu.sh
fi

if [[ "$1" == "coverage" ]]; then
  ./check_coverage.sh
fi
