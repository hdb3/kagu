FROM centos:centos7.6.1810
WORKDIR /build
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install deltarpm && yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel && yum clean all
RUN export GHCVER=8.6.5 ; curl https://downloads.haskell.org/~ghc/${GHCVER}/ghc-${GHCVER}-x86_64-deb8-linux.tar.xz | tar xJ && \
    cd ghc-${GHCVER} && ./configure --exec-prefix=/usr --prefix=/usr && make install
RUN export CABALVER=2.4.1.0 ; curl http://hackage.haskell.org/package/cabal-install-${CABALVER}/cabal-install-${CABALVER}.tar.gz | tar xz && \
    cd cabal-install-${CABALVER}/ && ./bootstrap.sh -j --global && \
    cp /usr/local/bin/cabal /usr/bin
RUN cabal update
ENTRYPOINT ["/bin/bash", "-il"]
