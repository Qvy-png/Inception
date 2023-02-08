# #!/bin/sh

# if [ ! -d "/run/mysqld" ]; then
#         mkdir -p /run/mysqld
#         chown -R mysql:mysql /run/mysqld
# 	service mysql start

# fi

# if [ ! -d "/var/lib/mysql/mysql" ]; then
	
# 	chown -R mysql:mysql /var/lib/mysql

# 	# init database
# 	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# 	tfile=`mktemp`
# 	if [ ! -f "$tfile" ]; then
# 		return 1
# 	fi
# 	service mysql start

# cat << EOF > $tfile

# USE mysql;
# FLUSH PRIVILEGES;

# DELETE FROM	mysql.user WHERE User='';
# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';

# CREATE DATABASE IF NOT EXISTS `$WP_DATABASE_NAME`;
# CREATE USER IF NOT EXISTS `$WP_DATABASE_USR`@'localhost' IDENTIFIED BY '$WP_DATABASE_PWD';
# GRANT ALL PRIVILEGES ON `$WP_DATABASE_NAME`.* TO `$WP_DATABASE_USR`@'%' IDENTIFIED BY '$WP_DATABASE_PWD';


# FLUSH PPRIVILEGES;
# EOF

#         /usr/bin/mysqld --user=mysql --bootstrap < $tfile
#         rm -f $tfile
# fi

# #reboot mysql to apply the changes
# mysqladmin -u root -p$WP_DATABASE_PWD shutdown
# exec mysqld_safe


# CREATE DATABASE $WP_DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED by '$WP_DATABASE_PWD';
# GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';

#!/bin/sh

# -e <=> --execute

service mysql start;
mysql --execute "CREATE DATABASE IF NOT EXISTS \`${WP_DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${WP_DATABASE_USR}\`@'localhost' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DATABASE_NAME}\`.* TO \`${WP_DATABASE_USR}\`@'%' IDENTIFIED BY '${WP_DATABASE_PWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"
# restart mariadb
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
exec mysqld_safe