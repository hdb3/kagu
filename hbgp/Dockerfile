FROM stack
WORKDIR /build
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master hbgp.json
#RUN export RESOLVER="lts-12.26" && \
RUN export RESOLVER="lts-13.25" && \
    git clone https://github.com/hdb3/hBGP.git && cd hBGP && stack --resolver $RESOLVER build && stack --resolver $RESOLVER install
FROM base
COPY --from=0 /root/.local/bin/hbgp /usr/bin/
COPY --from=0 /build/hbgp.json /root
COPY run.sh /root
COPY bgp.conf /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
