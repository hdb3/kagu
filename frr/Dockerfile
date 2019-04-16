FROM centos:centos7.6.1810
RUN yum -y install https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-8/CentOS-7-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm && \
    yum -y install https://github.com/FRRouting/frr/releases/download/frr-7.0/frr-7.0-01.el7.centos.x86_64.rpm
COPY bgpd.conf /etc/frr/
ENTRYPOINT [ "/usr/lib/frr/bgpd", "-n", "--log-level", "debug", "--log", "stdout", "-f", "/etc/frr/bgpd.conf" ]
