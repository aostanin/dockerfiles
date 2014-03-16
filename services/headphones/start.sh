#! /bin/sh

set -e

(cd /headphones && git pull)
python2.7 /headphones/Headphones.py --daemon --datadir=/data --config=/data/headphones.ini
tail -f /data/logs/*.log
