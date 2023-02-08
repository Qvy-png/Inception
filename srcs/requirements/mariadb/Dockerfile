FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client



COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /tmp/configure.sh

ENTRYPOINT [ "sh", "/tmp/configure.sh" ]


