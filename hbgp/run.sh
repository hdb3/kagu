# run.sh for hbgp
if [ "$1" = "sysinfo" ]
then
  echo "VERSION='`/usr/bin/Router --version|head -1`'"
  /usr/bin/Sysinfo
else
  echo "starting hbgp"
  sleep 10
  /usr/bin/hbgp
fi
