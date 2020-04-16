FROM base
RUN yum -y install https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-8/CentOS-7-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm && \
    yum -y install https://github.com/FRRouting/frr/releases/download/frr-7.2/frr-7.2-01.el6.x86_64.rpm && \
    yum clean all
COPY bgpd.conf /etc/frr/
COPY run.sh /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
