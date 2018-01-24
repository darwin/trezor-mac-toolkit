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
TREZOR_CORE_DIR="$REPOS_DIR/trezor-core"
PYTHON_TREZOR_DIR="$REPOS_DIR/python-trezor"

DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME:-"trezor-mac-toolkit-image"}
DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME:-"trezor-mac-toolkit"}

popd
