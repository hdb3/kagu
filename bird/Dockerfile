#FROM centos7.6
FROM centos:centos7.6.1810
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools"
RUN curl ftp://bird.network.cz/pub/bird/bird-1.6.6.tar.gz | tar xz && cd bird-1.6.6 && ./configure --prefix=/ --disable-client && make
FROM centos:centos7.6.1810
COPY bird.conf /etc
COPY --from=0 /build/bird-1.6.6/bird /usr/sbin/
#CMD export BIRDVERSION=`bird --version` ; echo "BIRDVERSION=\"${BIRDVERSION}\"" > /var/run/bgpspeaker
ENTRYPOINT ["/usr/sbin/bird", "-d"]
