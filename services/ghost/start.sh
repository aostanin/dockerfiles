#! /bin/sh

set -e

mkdir -p /data

if [ ! -f /data/config.js ]; then
  cp /ghost/config.example.js /data/config.js
fi

if [ ! -d /content.default ]; then
  mv /ghost/content /content.default
fi

if [ ! -d /data/content ]; then
  cp -r /content.default /data/content
fi

ln -sf /data/content /ghost/content
ln -sf /data/config.js /ghost/config.js

cd /ghost && npm start --production
