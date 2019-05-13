FROM kakapo
RUN yum -y install epel-release && yum -y install fping
COPY run.sh /root
ENTRYPOINT ["/bin/bash", "-xe", "/root/run.sh"]
