FROM wordpress:php7.4-fpm-alpine

RUN apk update &&  apk add nginx mysql-client
RUN mkdir /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./wp-config.php /usr/src/wordpress
ENTRYPOINT /usr/sbin/nginx && /usr/local/sbin/php-fpm