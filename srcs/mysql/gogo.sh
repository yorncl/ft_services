echo "FLUSH PRIVILEGES;
CREATE DATABASE wordpress_db;
CREATE DATABASE phpmyadmin;
GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'%' IDENTIFIED BY 'efficaceetpascher' WITH GRANT OPTION;
GRANT ALL ON phpmyadmin.* TO 'pma'@'%' IDENTIFIED BY 'cestlamafquejprefere';
GRANT ALL ON *.* TO 'bob'@'%' IDENTIFIED BY '123';" > /temporary

/usr/bin/mysqld --user=root --bootstrap < /temporary