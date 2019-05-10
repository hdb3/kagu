# run.sh for hbgp
#ip addr add 172.18.0.1/32 dev lo || echo "probabaly the address is already assigned"
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/bin/hbgp --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting hbgp"
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping -S 172.18.0.13 172.18.0.11 172.18.0.12 ; do echo "retry" ; done
  cd /root
  /usr/bin/hbgp
fi
