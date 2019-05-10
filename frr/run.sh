# run.sh for frr
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/lib/frr/bgpd --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting frr"
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping -S 172.18.0.13 172.18.0.11 172.18.0.12 ; do echo "retry" ; done
  /usr/lib/frr/bgpd -l 172.18.0.13 -n --log stdout -f /etc/frr/bgpd.conf
  # /usr/lib/frr/bgpd -p 0 -n --log stdout -f /etc/frr/bgpd.conf
fi
