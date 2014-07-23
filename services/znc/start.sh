#! /bin/sh

set -e

mkdir -p /data/configs
[ ! -f /data/configs/znc.conf ] && cp /znc.conf.default /data/configs/znc.conf

chown -R znc:znc /data

su znc -c "znc --foreground --datadir /data"
