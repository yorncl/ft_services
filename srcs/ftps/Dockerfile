FROM alpine:latest
RUN apk update && apk add vsftpd
RUN mkdir /srv/ftp
RUN chown nobody:nogroup /srv/ftp
RUN echo "anon" | tee /srv/ftp/anon.txt
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]