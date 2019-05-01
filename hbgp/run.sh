# run.sh for hbgp
ip addr add 169.254.0.1/32 dev lo || echo "probabaly the address is already assigned"
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/bin/Router --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting hbgp"
  cd /root
  /usr/bin/hbgp
fi
