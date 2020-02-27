FROM nginx:1.17.8-alpine


RUN apk update && apk add openssh vim
RUN yes "/etc/ssh/ssh_host_rsa_key" | ssh-keygen -P ""
COPY ./sshd_config /etc/ssh/sshd_config
RUN mkdir -p /home/admin/.ssh
COPY ./authorized_keys /home/admin/.ssh/authorized_keys
RUN adduser -D -h /home/admin admin
RUN echo "admin:admin" | chpasswd
RUN addgroup admin nginx
RUN chown -R admin:admin /home/admin/
RUN chmod 700 /home/admin/.ssh
RUN chmod 644 /home/admin/.ssh/authorized_keys

COPY ./nginx-selfsigned.crt /etc/nginx/ssl/localhost.crt
COPY ./nginx-selfsigned.key /etc/nginx/ssl/localhost.key

ENTRYPOINT  /usr/sbin/sshd && nginx -g "daemon off;"