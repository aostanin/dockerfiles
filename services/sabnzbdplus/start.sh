#! /bin/sh

set -e

(cd /sabnzbdplus && git pull)
python2.7 /sabnzbdplus/SABnzbd.py --daemon --config-file /data/sabnzbdplus.ini --server 0.0.0.0:8080
tail -f /data/logs/*.log
