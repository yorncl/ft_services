FROM alpine:latest

RUN apk update && apk add influxdb
RUN mkdir /data
COPY ./entrypoint.sh /entrypoint.sh
COPY ./init_db.sh /init_db.sh
COPY ./influxdb.conf /etc/influxdb.conf
COPY ./backup.db /backup.db
RUN chmod 777 /entrypoint.sh
RUN chmod 777 /init_db.sh
ENTRYPOINT /entrypoint.sh