FROM telegraf:alpine

ARG minikube_ip
ENV minikube_ip=$minikube_ip

COPY ./telegraf.conf /etc/telegraf/
RUN sed -i "s/{{{MINIKUBE_IP}}}/$minikube_ip/g" etc/telegraf/telegraf.conf
