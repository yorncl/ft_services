FROM alpine:latest

# nginx
RUN apk update &&  apk add nginx mysql-client
RUN mkdir /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf

# fpm
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

# wp
RUN mkdir -p /var/www/html/wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O /tmp/latest-fr_FR.tar.gz
COPY ./wp-config.php /var/www/html/wordpress
RUN tar --strip-components=1 -xf /tmp/latest-fr_FR.tar.gz --directory /var/www/html/wordpress




ENTRYPOINT php-fpm7 && nginx -g "daemon off;"
# ENTRYPOINT /usr/sbin/nginx && /usr/local/sbin/php-fpm