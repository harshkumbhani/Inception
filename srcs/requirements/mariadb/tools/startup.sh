#!/bin/sh

if [ ! -d /var/lib/mysql/mariadb ]; then
echo "
CREATE DATABASE IF NOT EXISTS mariadb;
CREATE USER IF NOT EXISTS 'hkumbhan'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON mariadb.* TO 'hkumbhan'@'%';
FLUSH PRIVILEGES;
" | /usr/bin/mariadbd --user=mysql --bootstrap
fi

exec /usr/bin/mariadbd --datadir=/var/lib/mysql --user=mysql
