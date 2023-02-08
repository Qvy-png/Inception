#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_NAME --dbpass=$WP_DATABASE_PWD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 2
wp core install     --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $WP_USR $WP_EMAIL --user_pass=$WP_PWD --path='/var/www/wordpress' >> /log.txt
fi


if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F