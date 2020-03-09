
if [ -z "$(ls -A /root/.influxdb/data 2> /dev/null)" ]; then
	echo "CREATINGDATA"
	bash /init_db.sh
fi

influxd