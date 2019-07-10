FROM base
RUN yum -y install wget && \
    wget https://github.com/osrg/gobgp/releases/download/v2.6.0/gobgp_2.6.0_linux_amd64.tar.gz && \
    tar xf gobgp_2.6.0_linux_amd64.tar.gz && \
    cp gobgpd /sbin
COPY gobgpd.conf /etc/
COPY run.sh /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
