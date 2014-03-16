#! /bin/sh

set -e

mkdir -p /data/settings
touch /data/utorrent.config
touch /data/utorrent.log
unzip -oq /utorrent*/webui.zip -d /data/settings/webui

/utorrent*/utserver -settingspath /data/settings -logfile /data/utorrent.log -configfile /data/utorrent.config -daemon
tail -f /data/utorrent.log
