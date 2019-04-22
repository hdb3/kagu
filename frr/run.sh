/usr/lib/frr/bgpd --version |& cat > /var/www/thttpd/version.txt
/usr/bin/Sysinfo /> var/www/thttpd/sysinfo.txt

/usr/lib/frr/bgpd -p 0 -n --log stdout -f /etc/frr/bgpd.conf
