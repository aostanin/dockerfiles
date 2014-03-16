#! /bin/sh

set -e

if [ ! -f /data/nzbget.conf ]; then
  cp /usr/local/share/nzbget/nzbget.conf /data/nzbget.conf
fi

nzbget --configfile /data/nzbget.conf --daemon
