FROM hdb3/ghc
WORKDIR /build
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master version.json
RUN alias cabal=/usr/local/bin/cabal ; cabal update ; git clone https://github.com/hdb3/hBGP.git && cd hBGP && bash -xe build.sh 
FROM centos:centos7.6.1810
COPY --from=0 /root/.cabal/bin/* /usr/bin/
COPY --from=0 /build/version.json /root
ENTRYPOINT ["/bin/bash", "-il"]
