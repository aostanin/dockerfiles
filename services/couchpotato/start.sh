#! /bin/sh

set -e

git -C /couchpotato pull

python2.7 /couchpotato/CouchPotato.py --console_log --data_dir=/data --config_file=/data/couchpotato.ini
