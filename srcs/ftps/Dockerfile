FROM alpine:latest
RUN apk update && apk add vsftpd
RUN mkdir -p /home/admin
RUN adduser -D -h /home/admin admin
RUN echo "anon" | tee /home/admin/anon.txt
RUN echo "admin:admin" | chpasswd
RUN addgroup admin ftp
RUN chown -R admin:admin /home/admin/

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./ftps-selfsigned.crt /etc/ssl/ftps-selfsigned.crt
COPY ./ftps-selfsigned.key /etc/ssl/ftps-selfsigned.key
ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]