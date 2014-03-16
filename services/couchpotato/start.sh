#! /bin/sh

set -e

(cd /couchpotato && git pull)
python2.7 /couchpotato/CouchPotato.py --daemon --console_log --data_dir=/data --config_file=/data/couchpotato.ini
tail -f /data/logs/*.log
