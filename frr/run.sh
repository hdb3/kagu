# run.sh for frr
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/lib/frr/bgpd --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting frr"
  ip addr add 169.254.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping 169.254.0.11 169.254.0.12 ; do echo "retry" ; done
  /usr/lib/frr/bgpd -p 0 -n --log stdout -f /etc/frr/bgpd.conf
fi
