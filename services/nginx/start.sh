#! /bin/sh

set -e

mkdir -p /data

if [ ! -L /etc/nginx ]; then
  mv /etc/nginx /etc/nginx.default
  ln -s /data/nginx /etc/nginx
fi

if [ ! -f /data/nginx/nginx.conf ]; then
  mv /etc/nginx.default /data/nginx
fi

service nginx start

tail -f /var/log/nginx/*.log
