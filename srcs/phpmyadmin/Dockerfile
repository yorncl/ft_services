FROM phpmyadmin/phpmyadmin:fpm-alpine
RUN apk update && apk add nginx mysql-client php-gettext
RUN mkdir /run/nginx
RUN mkdir -p /usr/src/phpmyadmin/tmp/
RUN chown -R www-data:www-data /usr/src/phpmyadmin/tmp/
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./config.inc.php /etc/phpmyadmin/
ENTRYPOINT /usr/sbin/nginx && /usr/local/sbin/php-fpm