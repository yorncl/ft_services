FROM alpine:latest

RUN apk update && apk add influxdb bash
RUN mkdir /data
COPY ./entrypoint.sh /entrypoint.sh
COPY ./init_db.sh /init_db.sh
RUN chmod 777 /entrypoint.sh
RUN chmod 777 /init_db.sh
ENTRYPOINT /entrypoint.sh