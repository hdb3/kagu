#FROM centos:centos7.6.1810
FROM hdb3/ghc
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools"
RUN git clone https://github.com/hdb3/kakapo.git -b kagu && cd kakapo && bash -xe build.sh && \
    ghc tools/Sysinfo

FROM centos:centos7.6.1810
COPY --from=0 /build/kakapo/kakapo.debug /build/kakapo/kakapo /build/kakapo/tools/Sysinfo /usr/sbin/
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install dmidecode openssh-server iproute
RUN ssh-keygen -A
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""
RUN echo "root:root" | chpasswd
COPY run.sh /root
COPY authorized_keys /root/.ssh/
#ENTRYPOINT ["/usr/bin/find"]
#ENTRYPOINT ["/bin/top"]
#ENTRYPOINT ["/bin/bash", "-il"]
#ENTRYPOINT ["/usr/sbin/sshd", "-4", "-D", "-p", "65535"]
ENTRYPOINT ["/bin/bash", "-xe", "/root/run.sh"]
