FROM centos:centos7.6.1810
WORKDIR /build
RUN yum -y update && yum -y groupinstall "Development Tools"
RUN git clone https://github.com/hdb3/kakapo.git && cd kakapo && bash -xe build.sh
FROM centos:centos7.6.1810
COPY --from=0 /build/kakapo/kakapo /usr/sbin/
#ENTRYPOINT ["/usr/bin/find"]
#ENTRYPOINT ["/bin/top"]
ENTRYPOINT ["/bin/bash", "-il"]
