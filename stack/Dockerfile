FROM centos:7.7.1908
WORKDIR /build
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install deltarpm && yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel && yum clean all
RUN curl -sSL https://get.haskellstack.org/ | sh
# COPY Setup.hs  simple.cabal  Simple.hs  stack.yaml /build/
RUN stack update
# RUN stack --resolver lts-15.7 build
ENTRYPOINT ["/bin/bash", "-il"]
