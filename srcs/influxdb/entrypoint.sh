
if [ -z "$(ls -A /data)" ]; then
	/init_db.sh
fi

influxd