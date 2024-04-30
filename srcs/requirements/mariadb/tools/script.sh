#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

mysql_install_db --datadir=/var/lib/mysql --user=mysql --skip-test-db >> /dev/null

echo "" > tmp.sql
echo "FLUSH PRIVILEGES" >> tmp.sql

exec mysqld_safe