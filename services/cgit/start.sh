#! /bin/sh

set -e

[ ! -f /data/lighttpd.conf ] && cp /etc/lighttpd/lighttpd.conf.default /data/lighttpd.conf
[ ! -f /data/cgitrc ] && cp /etc/cgitrc.default /data/cgitrc

lighttpd -Df /data/lighttpd.conf
