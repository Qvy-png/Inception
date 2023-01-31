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

# config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# EXPOSE 443

# # start 
# ENTRYPOINT ["nginx", "-g", "daemon off;"]