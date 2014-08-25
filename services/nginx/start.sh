#! /bin/sh

set -e

[ ! -d /etc/nginx.default ] && mv /etc/nginx /etc/nginx.default
[ ! -L /etc/nginx ] && ln -s /data /etc/nginx
[ ! -f /data/nginx.conf ] && cp -r /etc/nginx.default/* /data

nginx -g "daemon off;"
