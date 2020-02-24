FROM phpmyadmin/phpmyadmin:fpm-alpine
RUN apk update && apk add nginx mysql-client php-gettext
RUN mkdir /run/nginx
# RUN chmod -R 777 /var/lib/php/session
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./config.inc.php /etc/phpmyadmin/
ENTRYPOINT /usr/sbin/nginx && /usr/local/sbin/php-fpm