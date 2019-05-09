#FROM centos:centos7.6.1810
FROM hdb3/ghc
WORKDIR /build
# next line required to invalidate Docker cache when the git repo has changed
ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/kagu version.json
RUN git clone https://github.com/hdb3/kakapo.git -b kagu && cd kakapo && bash -xe build.sh && \
    cd /build/kakapo/relay && bash -xe build.sh
FROM hdb3/base
COPY --from=0 /build/kakapo/relay/relay /build/kakapo/kakapo.debug /build/kakapo/kakapo /usr/sbin/
COPY --from=0 /build/version.json /root
ENTRYPOINT ["/bin/bash", "-il"]
