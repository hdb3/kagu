# run.sh for kakapo
if [ "$1" = "cdump" ]
then
  echo "testing core dumps"
  /root/cdump
else
  echo "starting kakapo"
  ip addr add 172.18.0.21/32 dev lo || echo "probably the address is already assigned"
  ip addr add 172.18.0.22/32 dev lo || echo "probably the address is already assigned"
fi
