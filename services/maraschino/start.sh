#! /bin/sh

set -e

(cd /maraschino && git pull)
python2.7 /maraschino/Maraschino.py --daemon --datadir=/data
tail -f /data/logs/*.log
