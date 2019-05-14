FROM kakapo
RUN yum -y install epel-release && yum -y install fping && yum clean all
COPY run.sh /root
ENTRYPOINT ["/bin/bash", "-e", "/root/run.sh"]
