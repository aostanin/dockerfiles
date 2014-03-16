#! /bin/sh

set -e

(cd /sickbeard && git pull)
python2.7 /sickbeard/SickBeard.py --nolaunch --daemon --datadir=/data --config=/data/sickbeard.ini
tail -f /data/Logs/*.log
