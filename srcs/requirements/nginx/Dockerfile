FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    curl \
    vim

# nginx SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj \
     "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=rdel-agu.42.fr/UID=rdel-agu"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]