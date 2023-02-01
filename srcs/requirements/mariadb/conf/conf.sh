#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
        mkdir -p /run/mysqld
        chown -R mysql:mysql /run/mysqld
fi

#starting mysql
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${WP_DATABASE_USR}\`@'localhost' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DATABASE_NAME}\`.* TO \`${WP_DATABASE_USR}\`@'%' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"

#reboot mysql to apply the changes
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
exec mysqld_safe


# /etc/init.d/mysql start

# if [ -d "/var/lib/mysql/$WP_DATABASE_NAME" ]
# then 
#     echo "Database exists - Nothing to be done"
# else
#     echo "Database does not exist - Creating database..."
#     mysql_install_db --user=$MYSQL_USER > /dev/null
#     mysql_secure_installation << _EOF_

# y
# $MYSQL_ROOT_PASSWORD
# $MYSQL_ROOT_PASSWORD
# y
# n
# y
# y
# _EOF_

#     echo "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME; GRANT ALL ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
#     mysql -uroot -p$MYSQL_ROOT_PWD $WP_DATABASE_NAME < /usr/local/bin/wordpress.sql 
#     echo "\n ----- Database configured -----\n"

# fi

# /etc/init.d/mysql stop

# exec "$@"