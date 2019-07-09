if [ "$1" = "sysinfo" ]
then
  echo "VERSION='openbgpd-6.5p0'"
  /usr/bin/sysinfo
else
  echo "starting bgpd"
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping -S 172.18.0.13 172.18.0.21 172.18.0.22 ; do echo "retry" ; sleep 5 ; done
  /usr/sbin/bgpd -d
fi
