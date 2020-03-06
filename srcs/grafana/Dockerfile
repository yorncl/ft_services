FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
        libc6-compat
RUN mkdir -p /etc/grafana/provisioning/
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz
RUN mkdir /grafana &&  tar -C /grafana --strip-components 1 -zxvf grafana-6.6.2.linux-amd64.tar.gz
ENV PATH=/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /grafana
ENTRYPOINT grafana-server