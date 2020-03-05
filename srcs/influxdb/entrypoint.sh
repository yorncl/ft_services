
if [ -z "$(ls -A /data)" ]; then
	bash /init_db.sh
fi

influxd