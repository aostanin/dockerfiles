#! /bin/sh

set -e

mkdir -p /data/db /data/lucene /data/thumbs
ln -sf /data/db /var/subsonic/db
ln -sf /data/lucene /var/subsonic/lucene
ln -sf /data/thumbs /var/subsonic/thumbs

service subsonic start
tail -f /var/subsonic/*.log
