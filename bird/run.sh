# run.sh for bird
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/sbin/bird --version |& cat`'"
  /usr/bin/Sysinfo
else
  echo "starting bird"
  sleep 2
  cat /etc/bird.conf
  /usr/sbin/bird -d
fi
