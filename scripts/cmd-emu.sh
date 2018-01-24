#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$TREZOR_CORE_DIR"

fail_if_micropython_not_present

echo_exec ./emu.sh "$@"
