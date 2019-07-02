FROM centos:centos7.6.1810
ARG VERSION=2.0.4
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-devel readline-devel && yum clean all
RUN curl ftp://bird.network.cz/pub/bird/bird-${VERSION}.tar.gz | tar xz && \
    cd bird-${VERSION} && \
    ./configure --prefix=/ && \
    make && \
    cp birdc bird ..
FROM base
COPY bird.conf /etc
COPY run.sh /root
COPY --from=0 /build/birdc /build/bird /usr/sbin/
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
