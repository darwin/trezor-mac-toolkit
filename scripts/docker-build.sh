#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$DOCKER_DIR"

docker build \
  -t "$DOCKER_IMAGE_NAME:latest" \
  .

