#! /bin/sh

set -e

touch /data/custom_params.ini
ln -sf /data/custom_params.ini /nzbmegasearch/NZBmegasearch/custom_params.ini
touch /nzbmegasearch/NZBmegasearch/logs/nzbmegasearch.log

(cd /nzbmegasearch && git pull)
python2.7 /nzbmegasearch/NZBmegasearch/mega2.py daemon
tail -f /nzbmegasearch/NZBmegasearch/logs/*.log
