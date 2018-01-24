#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$ROOT_DIR"

./scripts/update-trezor-core.sh
./scripts/update-python-trezor.sh