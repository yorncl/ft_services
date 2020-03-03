FROM alpine:latest

ENV PMA_HOST="Jeff"
ENV PMA_USER="Isrich"
ENV PMA_PASSWORD="oof"

# nginx
RUN apk add nginx mysql-client php-gettext
RUN mkdir /run/nginx
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chmod 777 /var/lib/phpmyadmin/tmp
COPY ./default.conf /etc/nginx/conf.d/default.conf

# fpm
RUN apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

# phpmyadmin
RUN apk update && apk add php-mbstring php-zip php-gd php-json php7-session
RUN mkdir -p /usr/share/phpmyadmin
RUN mkdir -p /var/lib/phpmyadmin
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz
RUN tar --strip-components=1 -xf phpMyAdmin-4.9.2-all-languages.tar.gz --directory /usr/share/phpmyadmin
COPY ./config.inc.php /usr/share/phpmyadmin/

ENTRYPOINT php-fpm7 && nginx -g "daemon off;"