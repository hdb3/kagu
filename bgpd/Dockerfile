FROM base
WORKDIR /build
# RUN yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-devel readline-devel && yum clean all
RUN export VER=6.6p0 ; curl http://cdn.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-${VER}.tar.gz | tar xz && \
    cd openbgpd-${VER} && \
    ./configure --sysconfdir=/etc && \
    make && \
    cp src/bgpd/bgpd src/bgpctl/bgpctl ..
FROM centos:7.7.1908
COPY bgpd.conf /etc
COPY --from=0 /build/bgpd /build/bgpctl /usr/sbin/
RUN  groupadd _bgpd && \
     useradd -g _bgpd -s /sbin/nologin -d /empty -c 'OpenBGPD daemon' _bgpd && \
     mkdir -p /empty && \
     chown 0 /empty && \
     chgrp 0 /empty && \
     chmod 0755 /empty

ENTRYPOINT ["/usr/sbin/bgpd", "-d"]
