FROM hdb3/ghc
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/ARProute/git/refs/heads/master version.json
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
RUN alias cabal=/usr/local/bin/cabal ; cabal update && \
    cabal install iproute && git clone https://github.com/hdb3/ARProute.git && cd ARProute && ghc -threaded -O2 ARProute && \
    cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/tools && ghc -threaded -O2 Sysinfo
FROM centos:centos7.6.1810
RUN yum -y install dmidecode iproute iputils
COPY --from=0 /build/ARProute/ARProute /usr/bin/
COPY --from=0 /build/kakapo/tools/Sysinfo /usr/bin/
COPY --from=0 /build/ARProute.json /root
COPY --from=0 /build/kakapo.json /root
ENTRYPOINT ["/bin/bash", "-il"]
