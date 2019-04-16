FROM centos:centos7.6.1810
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel
RUN curl https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-deb8-linux.tar.xz | tar xJ && cd ghc-8.6.4 && ./configure --prefix=/usr && make install && \
    curl http://hackage.haskell.org/package/cabal-install-2.4.1.0/cabal-install-2.4.1.0.tar.gz | tar xz && cd cabal-install-2.4.1.0/ && ./bootstrap.sh -j --global
ENTRYPOINT ["/bin/bash", "-il"]
