# run.sh for bird
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/sbin/bird --version |& cat`'"
  /usr/bin/Sysinfo
else
  echo "starting bird"
  ip addr add 169.254.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping 169.254.0.11 169.254.0.12 ; do echo "retry" ; done
  /usr/sbin/bird -d
fi
