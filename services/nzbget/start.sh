#! /bin/sh

set -e

[ ! -f /data/nzbget.conf ] && cp /usr/local/share/nzbget/nzbget.conf /data/nzbget.conf

nzbget --configfile /data/nzbget.conf --daemon
