echo "
FLUSH PRIVILEGES;
CREATE DATABASE wordpress_db;
GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'%' IDENTIFIED BY 'efficaceetpascher' WITH GRANT OPTION;
GRANT ALL ON phpmyadmin.* TO 'pma'@'%' IDENTIFIED BY 'cestlamafquejprefere';
GRANT ALL ON *.* TO 'bob'@'%' IDENTIFIED BY '123';" >> /create_tables.sql

/usr/bin/mysqld --user=root --bootstrap < /create_tables.sql