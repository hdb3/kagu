FROM centos:7.7.1908
ARG VERSION=2.0.7
WORKDIR /build
RUN yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum -y install ncurses-devel readline-devel && \
    yum clean all && \
    curl ftp://bird.network.cz/pub/bird/bird-${VERSION}.tar.gz | tar xz && \
    cd bird-${VERSION} && \
    ./configure --prefix=/ && \
    make && \
    cp birdc bird ..
FROM centos:7.7.1908
COPY bird.conf /etc
COPY run.sh /root
COPY --from=0 /build/birdc /build/bird /usr/sbin/
ENTRYPOINT ["/usr/sbin/bird", "-d"]
# ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
