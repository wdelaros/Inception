#!/bin/bash

service php7.3-fpm start
service php7.3-fpm stop

if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download --allow-root --path=/var/www/html
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
	wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_name="${WP_ADMIN}" --admin_password="${WP_PASSWORD}" --admin_email="${WP_EMAIL}" --skip-email
	wp user create --allow-root "${WP_USER}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASSWORD}" --role=author
	/usr/sbin/php-fpm7.3 -F
fi

if [ -f /var/www/html/wp-config.php ]; then
	/usr/sbin/php-fpm7.3 -F
fi