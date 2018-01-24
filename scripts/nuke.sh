#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$ROOT_DIR"

./scripts/nuke-workdir.sh
./scripts/nuke-repos.sh
