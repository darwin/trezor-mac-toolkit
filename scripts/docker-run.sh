#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$DOCKER_DIR"

docker run \
  --name "$DOCKER_CONTAINER_NAME" \
  -v "$ROOT_DIR:/trezor-mac-toolkit" \
  --rm \
  -it "$DOCKER_IMAGE_NAME" \
  "$@"
