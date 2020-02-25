FROM alpine:latest

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mkdir /run/mysqld
COPY gogo.sh /tmp
COPY ./create_tables.sql /
RUN sh /tmp/gogo.sh
COPY my.cnf /etc/my.cnf
ENTRYPOINT /usr/bin/mysqld --user=root