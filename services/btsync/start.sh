#! /bin/sh

set -e

[ ! -L /.sync ] && ln -sf /data /.sync

/btsync --nodaemon
