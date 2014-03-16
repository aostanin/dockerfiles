#! /bin/sh

set -e

if [ ! -d /wp-content.default ]; then
  mv /wordpress/wp-content /wp-content.default
fi

if [ ! -d /data/wp-content ]; then
  cp -r /wp-content.default /data/wp-content
fi

if [ ! -f /data/wp-config.php ]; then
  cp /wordpress/wp-config-sample.php /data/wp-config.php
fi

ln -sf /data/wp-content /wordpress/wp-content
ln -sf /data/wp-config.php /wordpress/wp-config.php

chown -R www-data:www-data /wordpress /data/wp-content

sed -i "s/'DB_HOST',\s*'[^']*'/'DB_HOST', '"$DB_PORT_3306_TCP_ADDR:$DB_PORT_3306_TCP_PORT"'/" /data/wp-config.php

service php5-fpm start
service nginx start

tail -f /var/log/nginx/*
