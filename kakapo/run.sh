



# run.sh for kakapo
if [ "$1" = "relay" ]
then
  echo "starting kakapo-relay"
  ip addr add 169.254.0.13/32 dev lo || echo "probabaly the address is already assigned"
  ip addr add 169.254.0.14/32 dev lo || echo "probabaly the address is already assigned"
  /usr/sbin/relay 169.254.0.11,169.254.0.13,64504 169.254.0.12,169.254.0.14,64504
else
  echo "starting kakapo"
  ip addr add 169.254.0.11/32 dev lo || echo "probabaly the address is already assigned"
  ip addr add 169.254.0.12/32 dev lo || echo "probabaly the address is already assigned"
  /usr/sbin/sshd -4 -D -p 65535
fi

