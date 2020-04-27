FROM ghcup
WORKDIR /build
ARG BRANCH=murmur-hash
# ARG BRANCH=master
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/${BRANCH} hbgp.json
RUN git clone https://github.com/hdb3/hBGP.git -b ${BRANCH} && \
    cd hBGP && \
    PATH="/root/.ghcup/bin/:$PATH" && \
    cabal build && \
    cabal install exe:hbgp exe:hbgp.event --installdir=/build/bin --install-method=copy --overwrite-policy=always
FROM centos:7.7.1908
COPY --from=0 /build/bin/hbgp /usr/bin
COPY --from=0 /build/bin/hbgp.event /usr/bin
COPY --from=0 /build/hbgp.json /root
COPY bgp.conf /root
ENTRYPOINT ["/bin/bash", "-il"]
