FROM alpine:latest

ARG minikube_ip
ENV minikube_ip=$minikube_ip


RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
RUN mkdir /run/mysqld
COPY ./create_tables.sql /
RUN sed -i "s/{{{MINIKUBE_IP}}}/$minikube_ip/g" /create_tables.sql
COPY ./entrypoint.sh /
COPY my.cnf /etc/my.cnf
RUN chmod 777 /entrypoint.sh
ENTRYPOINT sh /entrypoint.sh