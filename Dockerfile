FROM nvidia/cuda:12.6.0-cudnn-devel-ubi8

COPY ./usr/src /usr/src

RUN /usr/src/install.sh

WORKDIR /usr/src
