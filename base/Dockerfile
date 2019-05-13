FROM ghc
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
RUN cabal update
RUN cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/sysinfo && ghc -threaded -O2 Sysinfo
FROM centos:centos7.6.1810
RUN yum -y install epel-release && \
    yum -y install dmidecode iproute iputils fping openssh-clients rsync && \
    yum clean all
COPY --from=0 /build/kakapo/sysinfo/Sysinfo /usr/bin/
COPY --from=0 /build/kakapo.json /root
RUN type fping
ENTRYPOINT ["/bin/bash", "-il"]
