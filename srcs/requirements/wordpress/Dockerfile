FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php7.3\
	php-fpm \
	php-mysql \
	mariadb-client 

RUN apt-get -y install wget
RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.1.1.tar.gz && rm wordpress-6.1.1.tar.gz

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/param_wordpress.sh param_wordpress.sh

ENTRYPOINT ["bash", "param_wordpress.sh"]