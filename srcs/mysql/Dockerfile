FROM alpine:latest

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mkdir /run/mysqld
COPY gogo.sh /tmp
RUN sh /tmp/gogo.sh
 
# RUN mysql -u root -e "CREATE DATABASE wordpress_db"
# RUN mysql -u root -e "GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'efficaceetpascher' WITH GRANT OPTION"
# RUN mysql -u root -e "GRANT ALL ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'cestlamafquejprefere'" 
# RUN mysql -u root -e "GRANT ALL ON *.* TO 'bob'@'localhost' IDENTIFIED BY '123'"
# RUN bash

# ENTRYPOINT /usr/bin/mysqld --user=root
ENTRYPOINT tail -f /dev/null