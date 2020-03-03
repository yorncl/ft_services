FROM alpine:latest

ENV WORDPRESS_DB_HOST="Jeff"
ENV WORDPRESS_DB_NAME="Bezos"
ENV WORDPRESS_DB_USER="Isrich"
ENV WORDPRESS_DB_PASSWORD="oof"

# nginx
RUN apk update &&  apk add nginx mysql-client
RUN mkdir /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf

# fpm
RUN apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

# wp
RUN mkdir -p /var/www/html/wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O /tmp/latest-fr_FR.tar.gz
COPY ./wp-config.php /var/www/html/wordpress
RUN tar --strip-components=1 -xf /tmp/latest-fr_FR.tar.gz --directory /var/www/html/wordpress

ENTRYPOINT php-fpm7 && nginx -g "daemon off;"