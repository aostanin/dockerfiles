#! /bin/sh

set -e

mkdir -p /data/users

if [ ! -f /data/bitlbee/bitlbee.conf ]; then
  cp -r /etc/bitlbee /data/bitlbee
fi

chown -R bitlbee:bitlbee /data

bitlbee -n -v -D -c /data/bitlbee/bitlbee.conf -d /data/users
