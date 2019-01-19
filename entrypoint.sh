#!/bin/sh
echo "151.101.112.133 raw.githubusercontent.com" >> /etc/hosts
curl --silent https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | \
  grep -v "^0\.0\.0\.0 0\.0\.0\.0$" | grep '^0\.0\.0\.0' | \
  awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 0.0.0.0\""}' \
  > /etc/unbound/blacklist
exec unbound -c /etc/unbound/unbound.conf
