FROM alpine:latest
RUN apk add vsftpd
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
ENTRYPOINT /usr/sbin/vsftpd