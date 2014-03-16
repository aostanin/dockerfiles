#! /bin/sh

set -e

if [ ! -f /data/.znc/configs/znc.conf ]; then
  mkdir -p /data/.znc/configs
  cp /znc.conf.default /data/.znc/configs/znc.conf
fi

chown -R znc:znc /data

su -c "znc --foreground" znc
