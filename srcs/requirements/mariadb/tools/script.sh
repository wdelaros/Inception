#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

mysql_install_db --datadir=/var/lib/mysql --user=mysql --skip-test-db >> /dev/null

echo "FLUSH PRIVILEGES;" > tmp.sql
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" >> tmp.sql
echo "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';" >> tmp.sql
echo "ALTER USER \`root\`@\`localhost\` IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> tmp.sql
echo "FLUSH PRIVILEGES;" >> tmp.sql

mysqld --user=mysql --bootstrap --silent < tmp.sql

rm -f tmp.sql

exec mysqld_safe