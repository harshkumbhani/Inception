#!/bin/sh

rc-service mariadb start

while ! mysqladmin ping --silent; do
	sleep 1
done

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS mariadb;
CREATE USER IF NOT EXISTS 'hkumbhan'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON mariadb.* TO 'hkumbhan'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'r00t';
FLUSH PRIVILEGES;
EOF

# rc-service mariadb restart
rc-service mariadb stop

exec /usr/bin/mariadbd --datadir=/var/lib/mysql --user=mysql 
