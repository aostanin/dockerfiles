#! /bin/sh

set -e

[ ! -d /data/transcode ]        && mkdir /data/transcode
[ ! -L /data/transcode/ffmpeg ] && ln -sf /usr/bin/avconv /data/transcode/ffmpeg
[ ! -L /data/transcode/lame ]   && ln -sf /usr/bin/lame /data/transcode/lame

/usr/share/subsonic/subsonic.sh
