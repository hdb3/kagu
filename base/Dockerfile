# # FROM centos:7.7.1908
# FROM stack
# WORKDIR /build
# # this is the fix to force rebuild when git repo is modified
# ADD https://api.github.com/repos/hdb3/kakapo/git/refs/heads/master kakapo.json
# RUN cd /build ; git clone https://github.com/hdb3/kakapo.git && cd kakapo/sysinfo && stack build && stack install
# FROM centos:7.7.1908
# RUN yum -y install epel-release && \
#     yum -y install dmidecode iproute iputils fping openssh-clients rsync && \
#     yum clean all
# COPY --from=0 /root/.local/bin/sysinfo /usr/bin/
# COPY --from=0 /build/kakapo.json /root
# ENTRYPOINT ["/bin/bash", "-il"]
FROM centos:7.7.1908
WORKDIR /build
RUN rpm --import /etc/pki/rpm-gpg/*
RUN yum -y install deltarpm && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum -y install ncurses-libs ncurses-devel gmp-devel wget which zlib-devel dmidecode iproute iputils fping openssh-clients rsync && \
    yum clean all
# RUN curl -sSL https://get.haskellstack.org/ | sh
# COPY Setup.hs  simple.cabal  Simple.hs  stack.yaml /build/
# RUN stack update
# RUN stack --resolver lts-15.7 build
ENTRYPOINT ["/bin/bash", "-il"]