FROM centos:7.7.1908
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools" && yum -y install ncurses-devel readline-devel && yum clean all
RUN curl http://cdn.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-6.5p0.tar.gz | tar xz && \
    cd openbgpd-6.5p0 && \
    ./configure --sysconfdir=/etc && \
    make && \
    cp src/bgpd/bgpd src/bgpctl/bgpctl ..
FROM base
COPY bgpd.conf /etc
COPY run.sh /root
COPY --from=0 /build/bgpd /build/bgpctl /usr/sbin/
RUN  groupadd _bgpd && \
     useradd -g _bgpd -s /sbin/nologin -d /empty -c 'OpenBGPD daemon' _bgpd && \
     mkdir -p /empty && \
     chown 0 /empty && \
     chgrp 0 /empty && \
     chmod 0755 /empty

ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
