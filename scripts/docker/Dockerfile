FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential lsb-release software-properties-common wget curl git sudo fish
RUN apt-get install -y python python3 python3-pip

# see https://github.com/trezor/trezor-core/blob/master/docs/build.md#debianubuntu
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir pyblake2
RUN apt-get install -y scons libsdl2-dev:i386 libsdl2-image-dev:i386 gcc-multilib

VOLUME ["/trezor-mac-toolkit"]
WORKDIR "/trezor-mac-toolkit"
ENTRYPOINT ["/trezor-mac-toolkit/do.sh"]
CMD ["fish"]