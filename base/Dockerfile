FROM hdb3/ghc
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/ARProute/git/refs/heads/master ARProute.json
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
RUN cabal update
RUN cabal install iproute && git clone https://github.com/hdb3/ARProute.git && cd ARProute && ghc -threaded -O2 ARPRouter.hs && \
    cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/tools && ghc -threaded -O2 Sysinfo
FROM centos:centos7.6.1810
RUN yum -y install epel-release
RUN yum -y install dmidecode iproute iputils fping
COPY --from=0 /build/ARProute/ARPRouter /usr/bin/
COPY --from=0 /build/kakapo/tools/Sysinfo /usr/bin/
COPY --from=0 /build/ARProute.json /root
COPY --from=0 /build/kakapo.json /root
ENTRYPOINT ["/bin/bash", "-il"]
