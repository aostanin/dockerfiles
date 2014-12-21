#! /bin/sh

set -e

chown git:git /data /repositories
[ ! -e /data/repositories ] && ln -sf /repositories /data/repositories
[ ! -f /data/admin.pub ] && ssh-keygen -t rsa -C Gitolite -N "" -f /data/admin

su git -c "gitolite setup -pk /data/admin.pub"

/usr/sbin/sshd -D
