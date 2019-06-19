FROM stack
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
RUN cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/sysinfo && stack build && stack install
FROM centos:centos7.6.1810
RUN yum -y install epel-release && \
    yum -y install dmidecode iproute iputils fping openssh-clients rsync && \
    yum clean all
COPY --from=0 /root/.local/bin/sysinfo /usr/bin/
COPY --from=0 /build/kakapo.json /root
ENTRYPOINT ["/bin/bash", "-il"]
