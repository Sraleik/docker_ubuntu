FROM ubuntu:16.04
MAINTAINER Sraleik <sraleik@gmail.com>

RUN locale-gen fr_FR.UTF-8 

ENV TZ=Europe/Paris
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8
ENV LC_CTYPE fr_FR.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        git \
        vim-tiny \
        sudo \
        curl \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*

