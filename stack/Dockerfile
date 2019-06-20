FROM centos:centos7.6.1810
WORKDIR /build
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install deltarpm && yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel && yum clean all
RUN curl -sSL https://get.haskellstack.org/ | sh
COPY Setup.hs  simple.cabal  Simple.hs  stack.yaml /build/
RUN stack update
RUN stack --resolver lts-11.14 build
RUN stack --resolver lts-13.25 build
RUN stack --resolver lts-12.26 build
ENTRYPOINT ["/bin/bash", "-il"]
