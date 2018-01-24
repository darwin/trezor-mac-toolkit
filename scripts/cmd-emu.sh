#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$TREZOR_CORE_DIR"

if [[ ! -f "build/unix/micropython" ]]; then
  echo_err "$TREZOR_CORE_DIR/build/unix/micropython does not exist, you should run build_unix command to build it first"
  exit 1
fi

echo_exec ./emu.sh "$@"
