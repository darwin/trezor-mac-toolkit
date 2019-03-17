#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_config.sh" || true || source _config.sh # never executes, this is here just for IntelliJ Bash support to understand our sourcing

mkdir -p "$REPOS_DIR"

cd "$REPOS_DIR"

if [[ ! -d "trezor-core" ]]; then
  git clone --recursive https://github.com/trezor/trezor-core.git
else
  echo "trezor-core repo already exists => skipping git clone"
fi
if [[ ! -d "python-trezor" ]]; then
  git clone --recursive https://github.com/trezor/python-trezor.git
else
  echo "python-trezor repo already exists => skipping git clone"
fi

# https://github.com/trezor/trezor-core/blob/master/docs/build.md#build-instructions-for-emulator-unix-port
brew install scons sdl2 sdl2_image pkg-config
brew install protobuf

pip3 install --upgrade setuptools
pip3 install --no-cache-dir pyblake2
pip3 install protobuf
pip3 install pipenv
pip3 install -U pytest

# https://github.com/trezor/trezor-core/blob/master/docs/build.md#os-x
echo "For building firmware follow https://github.com/trezor/trezor-core/blob/master/docs/build.md#os-x"