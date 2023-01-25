FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl 

# nginx SSL

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -days 365 -x509 -nodes -sha256 \
    -out /etc/nginx/ssl/rdel-agu.42.fr.csr \
    -keyout /etc/nginx/ssl/rdel-agu.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=rdel-agu/CN=rdel-agu" 

# config

RUN mkdir -p /run/nginx
COPY conf/ngnix.conf /etc/nginx/conf.d/default.conf

# start 
ENTRYPOINT [ "nginx" ]