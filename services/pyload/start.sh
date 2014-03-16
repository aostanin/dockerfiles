#! /bin/sh

set -e

rm -f /data/pyload.pid

(echo /data; echo) | pyLoadCore --changedir

if [ ! -f /data/pyload.conf ]; then
  cp /.pyload/pyload.conf /data/pyload.conf
fi

pyLoadCore --daemon
tail -f /data/Logs/log.txt
