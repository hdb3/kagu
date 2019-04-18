ip addr add 169.254.0.11/32 dev lo || echo "probabaly the address is already assigned"
ip addr add 169.254.0.12/32 dev lo || echo "probabaly the address is already assigned"
/usr/sbin/sshd -4 -D -p 65535
