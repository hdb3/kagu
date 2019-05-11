



# run.sh for kakapo
if [ "$1" = "cdump" ]
then
  echo "testing core dumps"
  /root/cdump
  if [ ls core* ]
  then
    echo "core dump(s) found"
    for core in `ls core*`
    do
      curl -X PUT --data-binary @${core} http://10.30.65.209/coredump/${core}
      echo "put core file $core"
    done
    curl -X PUT --data-binary @/root/cdump http://10.30.65.209/coredump/cdump
      echo "put executable file too"
  fi
elif [ "$1" = "relay" ]
then
  echo "starting kakapo-relay"
  ip addr add 172.18.0.13/32 dev lo || echo "probabaly the address is already assigned"
  ip addr add 172.18.0.14/32 dev lo || echo "probabaly the address is already assigned"
  /usr/sbin/relay 172.18.0.11,172.18.0.13,64504 172.18.0.12,172.18.0.14,64504
else
  echo "starting kakapo"
  ip addr add 172.18.0.11/32 dev lo || echo "probabaly the address is already assigned"
  ip addr add 172.18.0.12/32 dev lo || echo "probabaly the address is already assigned"
  /usr/sbin/sshd -4 -D -p 65535
fi
