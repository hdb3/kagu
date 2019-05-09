# run.sh for hbgp
#ip addr add 169.254.0.1/32 dev lo || echo "probabaly the address is already assigned"
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/bin/hbgp --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting hbgp"
  ip addr add 169.254.0.13/32 dev lo || echo "probably the address is already assigned"
  /usr/bin/ARPRouter &
  until fping 169.254.0.11 169.254.0.12 ; do echo "retry" ; done
  cd /root
  /usr/bin/hbgp
fi
