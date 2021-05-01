FROM localrepo:5000/base
RUN yum -y install https://rpm.frrouting.org/repo/frr-stable-repo-1-0.el7.noarch.rpm && \
    yum -y install frr frr-pythontools
COPY bgpd.conf /etc/frr/
ENTRYPOINT ["/usr/lib/frr/bgpd", "-l", "7.0.0.1","-S","-Z", "-n", "--log", "stdout", "-f", "/etc/frr/bgpd.conf"]
