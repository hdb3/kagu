# run.sh for kakapo relay
echo "starting kakapo-relay"
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='relay 1.0.0'"
  /usr/bin/Sysinfo
else
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  ip addr add 172.18.0.14/32 dev lo || echo "probably the address is already assigned"
  until fping -S 172.18.0.13 172.18.0.11 172.18.0.12 ; do echo "retry" ; done
  /usr/sbin/relay 172.18.0.11,172.18.0.13,64504 172.18.0.12,172.18.0.14,64504
fi
