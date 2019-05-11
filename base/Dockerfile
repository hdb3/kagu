FROM hdb3/ghc
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
RUN cabal update
RUN cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/sysinfo && ghc -threaded -O2 Sysinfo
FROM centos:centos7.6.1810
RUN yum -y install epel-release
RUN yum -y install dmidecode iproute iputils fping
COPY --from=0 /build/kakapo/sysinfo/Sysinfo /usr/bin/
COPY --from=0 /build/kakapo.json /root
RUN type fping
ENTRYPOINT ["/bin/bash", "-il"]
#RUN yum -y install epel-release
#RUN yum -y install fping
#COPY --from=0 /root/cycle1.txt /root
#COPY --from=0 /usr/sbin/fping /usr/sbin/fping
