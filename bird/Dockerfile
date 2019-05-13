FROM centos:centos7.6.1810
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-devel readline-devel && \
    yum -y install epel-release && yum -y install fping && \
    yum clean all
RUN curl ftp://bird.network.cz/pub/bird/bird-1.6.6.tar.gz | tar xz && cd bird-1.6.6 && ./configure --prefix=/ && make
FROM base
COPY bird.conf /etc
COPY run.sh /root
COPY --from=0 /build/bird-1.6.6/birdc /build/bird-1.6.6/bird /usr/sbin/
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
