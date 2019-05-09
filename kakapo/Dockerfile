#FROM centos:centos7.6.1810
FROM hdb3/ghc
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools"
# next line required to invalidate Docker cache when the git repo has changed
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/kagu version.json
RUN git clone https://github.com/hdb3/kakapo.git -b kagu && cd kakapo && bash -xe build.sh && \
    ghc tools/Sysinfo && \
    cd /build/kakapo/relay && bash -xe build.sh
FROM centos:centos7.6.1810
COPY --from=0 /build/kakapo/relay/relay /build/kakapo/kakapo.debug /build/kakapo/kakapo /build/kakapo/tools/Sysinfo /usr/sbin/
COPY --from=0 /build/version.json /root
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install dmidecode openssh-server iproute
#RUN ssh-keygen -A
#RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""
#RUN echo "root:root" | chpasswd
#COPY run.sh /root
#COPY authorized_keys /root/.ssh/
ENTRYPOINT ["/bin/bash", "-il"]
#ENTRYPOINT ["/usr/sbin/sshd", "-4", "-D", "-p", "65535"]
#ENTRYPOINT ["/bin/bash", "-xe", "/root/run.sh"]
