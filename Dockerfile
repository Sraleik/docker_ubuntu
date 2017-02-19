FROM ubuntu:16.04
MAINTAINER Sraleik <sraleik@gmail.com>

ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN locale-gen fr_FR.UTF-8 && update-locale LANG=fr_FR.UTF-8

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        git \
        vim-tiny \
        sudo \
        curl \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*
