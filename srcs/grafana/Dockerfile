FROM alpine:latest

# RUN apk update && apk add grafana


RUN wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz
RUN mkdir /grafana &&  tar -C /grafana --strip-components 1 -zxvf grafana-6.6.2.linux-amd64.tar.gz
ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# ENTRYPOINT tail -f /dev/null
ENTRYPOINT grafana-server