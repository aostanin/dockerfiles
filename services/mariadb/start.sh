#! /bin/sh

set -e

if [ ! -f /etc/mysql/my.cnf.default ]; then
  mv /etc/mysql/my.cnf /etc/mysql/my.cnf.default
  sed -i '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf.default
fi

if [ ! -f /data/my.cnf ]; then
  cp /etc/mysql/my.cnf.default /data/my.cnf
fi

if [ ! -d /var/lib/mysql.default ]; then
  mv /var/lib/mysql /var/lib/mysql.default
fi

if [ ! -d /data/db ]; then
  cp -rp /var/lib/mysql.default /data/db
  sed -i 's/^datadir\s.*/datadir = \/data\/db/g' /data/my.cnf
fi

ln -sf /data/my.cnf /etc/mysql/my.cnf
chown mysql:mysql /data

bash

service mysql start

if [ ! -f /data/.root_password ]; then
  MARIADB_PASSWORD=$(</dev/urandom tr -dc A-Za-z0-9| (head -c $1 > /dev/null 2>&1 || head -c 32))

  mysqladmin -u root password $MARIADB_PASSWORD
  mysql -u root -p$MARIADB_PASSWORD -e "UPDATE mysql.user SET host='%' WHERE user='root' AND host='localhost';  FLUSH PRIVILEGES;"

  echo $MARIADB_PASSWORD > /data/.root_password
  chmod 600 /data/.root_password

  echo Set root password to $MARIADB_PASSWORD
fi

tail -f /var/log/mysql.err
