#! /bin/sh

set -e

mkdir -p /root/.config
[ ! -L /root/.config/NzbDrone ] && ln -s /data /root/.config/NzbDrone

mono /opt/NzbDrone/NzbDrone.exe
