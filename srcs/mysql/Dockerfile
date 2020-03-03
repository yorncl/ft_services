FROM alpine:latest

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
RUN mkdir /run/mysqld
COPY ./create_tables.sql /
COPY ./entrypoint.sh /
COPY my.cnf /etc/my.cnf
RUN chmod 777 /entrypoint.sh
ENTRYPOINT sh /entrypoint.sh