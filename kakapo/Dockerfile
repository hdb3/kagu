#FROM centos:centos7.6.1810
FROM hdb3/ghc
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools"
RUN git clone https://github.com/hdb3/kakapo.git && cd kakapo && bash -xe build.sh && \
    ghc tools/Sysinfo

FROM centos:centos7.6.1810
COPY --from=0 /build/kakapo/kakapo /build/kakapo/tools/Sysinfo /usr/sbin/
RUN yum -y install dmidecode
#ENTRYPOINT ["/usr/bin/find"]
#ENTRYPOINT ["/bin/top"]
ENTRYPOINT ["/bin/bash", "-il"]
