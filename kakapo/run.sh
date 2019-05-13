



# run.sh for kakapo
if [ "$1" = "cdump" ]
then
  echo "testing core dumps"
  /root/cdump
elif [ "$1" = "relay" ]
then
  echo "starting kakapo-relay"
  ip addr add 172.18.0.13/32 dev lo || echo "probably the address is already assigned"
  ip addr add 172.18.0.14/32 dev lo || echo "probably the address is already assigned"
  /usr/sbin/relay 172.18.0.11,172.18.0.13,64504 172.18.0.12,172.18.0.14,64504
else
  echo "starting kakapo"
  ip addr add 172.18.0.11/32 dev lo || echo "probably the address is already assigned"
  ip addr add 172.18.0.12/32 dev lo || echo "probably the address is already assigned"
  /usr/sbin/sshd -4 -D -p 65535
fi
