#! /bin/sh

set -e

[ ! -f /data/config.js ] && cp /ghost/config.example.js /data/config.js
[ ! -d /content.default ] && mv /ghost/content /content.default
[ ! -d /data/content ] && cp -r /content.default /data/content

[ ! -L /ghost/content ] && ln -sf /data/content /ghost/content
[ ! -L /ghost/config.js ] && ln -sf /data/config.js /ghost/config.js

npm start --production
