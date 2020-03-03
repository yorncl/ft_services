if [ -z "$(ls -A /var/lib/mysql)" ]; then
    echo "CREATING DATABASES"
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	/usr/bin/mysqld --user=root --bootstrap < /create_tables.sql
else
    echo "DATABASES already exists"
	/usr/bin/mysqld --user=root
fi