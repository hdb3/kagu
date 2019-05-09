# run.sh for kakapo relay
echo "starting kakapo-relay"
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='relay 1.0.0'"
  /usr/bin/Sysinfo
else
  ip addr add 169.254.0.13/32 dev lo || echo "probably the address is already assigned"
  ip addr add 169.254.0.14/32 dev lo || echo "probably the address is already assigned"
  /usr/bin/ARPRouter &
  until fping 169.254.0.11 169.254.0.12 ; do echo "retry" ; done
  /usr/sbin/relay 169.254.0.11,169.254.0.13,64504 169.254.0.12,169.254.0.14,64504
fi
