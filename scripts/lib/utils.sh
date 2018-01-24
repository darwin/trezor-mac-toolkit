#!/usr/bin/env bash

pushd() {
    command pushd "$@" > /dev/null
}

popd() {
    command popd "$@" > /dev/null
}

echo_err() {
  printf "\e[31m%s\e[0m\n" "$*" >&2;
}

echo_cmd() {
  echo "(in $(pwd)) $ $@"
  "$@"
}

echo_exec() {
  echo "(in $(pwd)) $ $@"
  exec "$@"
}

fail_if_micropython_not_present() {
  MICROPYTHON_PATH="build/unix/micropython"
  if [[ ! -f "$MICROPYTHON_PATH" ]]; then
    echo_err "'$(pwd)/$MICROPYTHON_PATH' does not exist, you should run \`./do.sh build_unix\` command first"
    exit ${1:-1}
  fi
}

