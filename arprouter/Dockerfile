FROM stack
WORKDIR /build
ADD https://api.github.com/repos/hdb3/arproute/git/refs/heads/master version.json
RUN git clone https://github.com/hdb3/arproute.git && cd arproute && bash -xe make.sh
FROM centos:centos7.6.1810
#COPY --from=0 /root//bin/* /usr/bin/
COPY --from=0 /build/arproute/arproute.tgz /root
COPY --from=0 /build/version.json /root
ENTRYPOINT ["/bin/bash", "-il"]
