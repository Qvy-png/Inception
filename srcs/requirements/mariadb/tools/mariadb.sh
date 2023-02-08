
#!/bin/sh

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${WP_DATABASE_USR}\`@'localhost' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DATABASE_NAME}\`.* TO \`${WP_DATABASE_USR}\`@'%' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"
# restart mariadb
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
exec mysqld_safe