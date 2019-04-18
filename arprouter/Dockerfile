FROM hdb3/ghc
WORKDIR /build
RUN alias cabal=/usr/local/bin/cabal ; cabal update ; git clone https://github.com/hdb3/ARProuter.git && cd ARProuter && cabal install -- only-dependencies && cabal configure && cabal build && cabal install
FROM centos:centos7.6.1810
COPY --from=0 /root/.cabal/bin/* /usr/bin/
ENTRYPOINT ["/bin/bash", "-il"]
