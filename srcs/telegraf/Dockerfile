FROM alpine:latest

ARG minikube_ip
ENV minikube_ip=$minikube_ip

ENV TELEGRAF_VERSION 1.13.4

RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
    mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
    mv /usr/src/telegraf*/telegraf.conf /etc/telegraf/ && \
    chmod +x /usr/src/telegraf*/* && \
    cp -a /usr/src/telegraf*/* /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg

COPY ./telegraf.conf /etc/telegraf/
RUN sed -i "s/{{{MINIKUBE_IP}}}/$minikube_ip/g" etc/telegraf/telegraf.conf

ENTRYPOINT telegraf