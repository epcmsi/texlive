FROM archlinux/base:latest

ARG VERSION="2019.50917-1"
LABEL build_version="TeX Live version:- ${VERSION}"
LABEL maintainer="Mattia Simonetti"

RUN \
    echo "**** install TeX Live ****" && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        texlive-most \
        texlive-lang \
        biber \
        rsync \
        grep \
        make \
        git \
        openssh \
        which

RUN \
    echo "**** Clean up ****" && \
    pacman -Scc --noconfirm && \
    rm -rf \
        /tmp/* \
        /var/tmp/*
