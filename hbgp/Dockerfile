FROM ghc
WORKDIR /build
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master hbgp.json
RUN alias cabal=/usr/local/bin/cabal ; cabal update ; git clone https://github.com/hdb3/hBGP.git -b newbuild && cd hBGP && cabal install --only-dependencies && cabal build
FROM base
COPY --from=0 /build/hBGP/dist/build/hbgp/hbgp /usr/bin/
COPY --from=0 /build/hbgp.json /root
COPY run.sh /root
COPY bgp.conf /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
