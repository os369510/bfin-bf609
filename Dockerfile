FROM ubuntu:18.04

MAINTAINER os369510@gmail.com

ENV Contact=os369510@gmail.com
ENV User=jeremysu
ENV PATH="/opt/uClinux/bfin-elf/bin:/opt/uClinux/bfin-linux-uclibc/bin:/opt/uClinux/bfin-uclinux/bin:${PATH}"

LABEL Owner=os369510

USER root

RUN apt-get update && apt-get install -yqq \
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
    libx11-dev \
    sudo

RUN useradd -ms /bin/bash ${User} && echo "${User}:${User}" | chpasswd && adduser ${User} sudo

RUN apt-get autoclean -yqq && \
    apt-get autoremove -yqq && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

USER ${User}
