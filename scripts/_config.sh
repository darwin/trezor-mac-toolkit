#!/usr/bin/env bash

# standard bash switches for our scripts
set -e -o pipefail

pushd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null

source "lib/utils.sh"

cd ..

ROOT_DIR=`pwd`

SCRIPTS_DIR="$ROOT_DIR/scripts"
WORK_DIR="$ROOT_DIR/.workdir"
REPOS_DIR="$ROOT_DIR/repos"
DOCKER_DIR="$SCRIPTS_DIR/docker"

DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME:-"trezor-image"}
DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME:-"trezor"}

popd
