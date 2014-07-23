#! /bin/sh

set -e

mkdir -p /data/db /data/lucene /data/lucene2 /data/thumbs
[ ! -L /var/subsonic/db ]      && ln -sf /data/db      /var/subsonic/db
[ ! -L /var/subsonic/lucene ]  && ln -sf /data/lucene  /var/subsonic/lucene
[ ! -L /var/subsonic/lucene2 ] && ln -sf /data/lucene2 /var/subsonic/lucene2
[ ! -L /var/subsonic/thumbs ]  && ln -sf /data/thumbs  /var/subsonic/thumbs

/usr/share/subsonic/subsonic.sh
