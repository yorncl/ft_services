echo "FLUSH PRIVILEGES;
CREATE DATABASE wordpress_db;
GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'efficaceetpascher' WITH GRANT OPTION;
GRANT ALL ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'cestlamafquejprefere';
GRANT ALL ON *.* TO 'bob'@'localhost' IDENTIFIED BY '123';" > /temporary

/usr/bin/mysqld --user=root --bootstrap --init-file=/temporary