# run.sh for bird
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/sbin/bird --version |& cat`'"
  /usr/bin/sysinfo
else
  echo "starting bird2"
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  until fping -S 172.18.0.13 172.18.0.21 172.18.0.22 ; do echo "retry" ; done
  /usr/sbin/bird -d
fi
