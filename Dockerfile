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

RUN git clone https://git.code.sf.net/p/adi-buildroot/code adi-buildroot-code -b 2014R1
RUN git clone https://git.code.sf.net/p/adi-toolchain/blackfin adi-toolchain-blackfin -b 2014R1
RUN git clone https://git.code.sf.net/p/adi-linux/code adi-linux-code -b 2014R1
RUN git clone https://git.code.sf.net/p/adi-u-boot/code adi-u-boot-code -b 2014R1
RUN echo export 'PATH=$PATH:/opt/uClinux/bfin-uclinux/bin:/opt/uClinux/bfin-linux-uclibc/bin' >> /home/user/.bashrc

USER user
