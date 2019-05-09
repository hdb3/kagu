# run.sh for frr
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/lib/frr/bgpd --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting frr"
  sleep 2
  /usr/lib/frr/bgpd -p 0 -n --log stdout -f /etc/frr/bgpd.conf
fi
