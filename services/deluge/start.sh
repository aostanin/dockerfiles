#! /bin/sh

set -e

rm -f /data/deluged.pid

deluged -c /data -L info -l /data/deluged.log
deluge-web -c /data
