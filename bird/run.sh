# run.sh for bird
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/sbin/bird --version |& cat`'"
  /usr/bin/Sysinfo
else
  echo "starting bird"
  sleep 10
  /usr/sbin/bird -d
fi
