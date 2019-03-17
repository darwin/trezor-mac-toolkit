# Mac toolkit for Trezor 

This is a toolkit for macOS users who want to start tinkering with Trezor stack.

Currently it is only for my personal education.  

## Rationale 

Trezor devs don't use macOS on daily basis and their docs/tools could have sharp edges when trying to use them under macOS.

The idea is to maintain some convenience scripts to

1) keep interesting Trezor repos maintained side-by-side with paths properly set for macOS
2) have tools like emulator and tests working under native macOS 

And to cross check our macOS setup I also maintain a custom Docker container for trying the same operations under 
Linux (I use Ubuntu which should be more native environment to follow Trezor development). 

## Initial setup

```bash
git clone --recursive https://github.com/darwin/trezor-mac-toolkit.git
cd trezor-mac-toolkit
./scripts/bootstrap.sh
```

To build the docker image:

```bash
./scripts/docker-build.sh
```

To invoke commands in the docker container:

```bash
./scripts/docker-run.sh [arg1] [arg2] ...
```

## The `do.sh` command

This is a wrapper command for convenience. It can be run on native macOS directly or via `docker-run.sh` 
which invokes it by default inside the docker container. I also provide `ddo.sh` which stands for "docker do" as
a shortcut for invoking `./scripts/docker-run.sh`.

```bash
 ./do.sh prepare # prepare python environments 
 ./do.sh build_unix

 # or alternatively
 ./ddo.sh prepare
 ./ddo.sh build_unix
  
 # to enter shell inside the container:
 ./ddo.sh bash
 
```

Note that trezor-mac-toolkit directory is mapped as a volume inside the container under `/trezor-mac-toolkit`.

### More examples:

```bash
./ddo.sh prepare
./ddo.sh test unit
./ddo.sh test device
./ddo.sh test coverage
./ddo.sh test # will test all above

./do.sh emu
```
