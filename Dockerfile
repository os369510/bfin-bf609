FROM ubuntu:18.04

MAINTAINER os369510@gmail.com

ENV Contact=os369510@gmail.com

LABEL Owner=os369510

USER root

RUN apt-get update && apt-get install -yq \
    curl \
    autoconf \
    automake \
    bash \
    binutils \
    bison \
    bzip2 \
    coreutils \
    flex \
    gawk \
    gcc \
    gettext \
    grep \
    intltool \
    iputils-ping \
    libtool \
    linux-libc-dev \
    liblzo2-dev \
    liblzo2-2 \
    libncurses5 \
    libreadline5 \
    libglib2.0-dev \
    libreadline-gplv2-dev \
    libncurses5-dev \
    libpixman-1-dev \
    m4 \
    make \
    pax-utils \
    pkg-config \
    rpm \
    texinfo \
    zlib1g \
    zlib1g-dev \
    uuid-dev \
    git \
    vim \
    rsync \
    wget \
    cpio \
    python \
    unzip \
    bc \
    subversion \
    locales \
    libx11-dev

USER user
