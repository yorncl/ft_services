FROM wordpress:php7.4-fpm-alpine

RUN apk update &&  apk add nginx mysql-client
RUN mkdir /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf
RUN sed -i '$ d' /usr/local/bin/docker-entrypoint.sh
RUN echo "/usr/sbin/nginx && /usr/local/sbin/php-fpm" >> /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "php-fpm"]