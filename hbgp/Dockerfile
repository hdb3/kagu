FROM stack
WORKDIR /build
ADD https://api.github.com/repos/hdb3/hBGP/git/refs/heads/master hbgp.json
RUN git clone https://github.com/hdb3/hBGP.git && cd hBGP && stack build && stack install
FROM base
COPY --from=0 /root/.local/bin/hbgp /usr/bin/
COPY --from=0 /build/hbgp.json /root
COPY run.sh /root
COPY bgp.conf /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
