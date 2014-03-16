#! /bin/sh

set -e

mkdir -p /data

if [ ! -f /data/btsync.conf ]; then
  cp /btsync.conf /data/btsync.conf
fi

/btsync --nodaemon --config /data/btsync.conf
