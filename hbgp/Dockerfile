FROM hdb3/ghc
WORKDIR /build
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master version.json
RUN alias cabal=/usr/local/bin/cabal ; cabal update ; git clone https://github.com/hdb3/hBGP.git -b newbuild && cd hBGP && cabal build
FROM centos:centos7.6.1810
RUN yum -y install dmidecode
COPY Sysinfo /usr/bin/
COPY --from=0 /root/hBGP/dist/build/hbgp/hbgp /usr/bin/
#COPY --from=0 /root/.cabal/bin/* /usr/bin/
COPY --from=0 /build/version.json /root
COPY run.sh /root
#ENTRYPOINT ["/bin/bash", "-e"]
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
