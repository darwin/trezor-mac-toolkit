FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential lsb-release software-properties-common wget curl git sudo fish
RUN apt-get install -y python python3 python3-dev python3-pip

# see https://github.com/trezor/trezor-core/blob/master/docs/build.md#debianubuntu
RUN apt-get install -y scons libsdl2-dev libsdl2-image-dev
RUN apt-get install -y scons gcc-arm-none-eabi libnewlib-arm-none-eabi
# https://github.com/trezor/python-trezor#debian--ubuntu
RUN apt-get install -y python3-dev python3-pip cython3 libusb-1.0-0-dev libudev-dev
# https://github.com/trezor/python-trezor#building-from-source
RUN apt-get install -y protobuf-compiler libprotobuf-dev
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir pyblake2
RUN pip3 install click
RUN pip3 install pipenv
RUN pip3 install protobuf
RUN pip3 install -U pytest

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
# https://github.com/pypa/pipenv/issues/2681#issuecomment-473693557
ENV PIPENV_TIMEOUT=900

VOLUME ["/trezor-mac-toolkit"]
WORKDIR "/trezor-mac-toolkit"
ENTRYPOINT ["/trezor-mac-toolkit/do.sh"]
CMD ["fish"]
