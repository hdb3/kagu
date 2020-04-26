FROM centos:7.7.1908
WORKDIR /build
RUN rpm --import /etc/pki/rpm-gpg/* && \
    yum -y install deltarpm && yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel && yum clean all
RUN wget https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup -O ghcup && \
    chmod +x ghcup && \
    ./ghcup  install 8.8.3 && \
    ./ghcup  install 8.10.1 && \
    ./ghcup set 8.10.1 && \
    ./ghcup install-cabal 3.2.0.0
RUN /root/.ghcup/bin/cabal update
ENTRYPOINT ["/bin/bash", "-il"]
