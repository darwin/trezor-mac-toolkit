#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

cd "$DOCKER_DIR"

# we need to overlay repos/trezor-core/build so that mac builds don't clash with unix-y builds inside the container
# see https://stackoverflow.com/a/38601156/84283 for build dir override
# SDL_VIDEODRIVER=dummy is needed to work around "Failed to connect to the Mir Server" errors,
# because SDL doesn't have GUI inside docker container
docker run \
  --name "$DOCKER_CONTAINER_NAME" \
  --network=host \
  --mount "type=bind,source=$ROOT_DIR,destination=/trezor-mac-toolkit" \
  --mount "type=volume,source=trezor-core-build,destination=/trezor-mac-toolkit/repos/trezor-core/build" \
  --rm \
  -e SDL_VIDEODRIVER=dummy \
  -it "$DOCKER_IMAGE_NAME" \
  "$@"
