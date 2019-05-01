FROM hdb3/ghc
WORKDIR /build
# this is the fix to force rebuild when git repo is modified
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master version.json
RUN alias cabal=/usr/local/bin/cabal ; cabal update ; git clone https://github.com/hdb3/hBGP.git -b newbuild && cd hBGP && cabal install --only-dependencies && cabal build
FROM centos:centos7.6.1810
RUN yum -y install dmidecode iproute
COPY Sysinfo /usr/bin/
COPY --from=0 /build/hBGP/dist/build/hbgp/hbgp /usr/bin/
COPY --from=0 /build/version.json /root
COPY run.sh /root
COPY bgp.conf /root
#ENTRYPOINT ["/bin/bash", "-il"]
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
