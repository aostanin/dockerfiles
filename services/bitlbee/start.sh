#! /bin/sh

set -e

mkdir -p /data/users
chown -R bitlbee:bitlbee /data/users

[ ! -d /data/bitlbee ] && cp -r /etc/bitlbee /data/bitlbee

bitlbee -n -v -D -c /data/bitlbee/bitlbee.conf -d /data/users
