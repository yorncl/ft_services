influxd &

for i in {30..0}
do
	echo "Trying to execute queries, attempt: $i"
	if influx -execute "CREATE USER telegrafist WITH PASSWORD 'okboomer' WITH ALL PRIVILEGES"
	then
		influx -execute "CREATE DATABASE \"telegraf\""
		echo "Created telegraf database"
		break
	fi
	echo 'influxdb init process in progress...'
	sleep 1
done

if [ "$i" = 0 ]; then
		echo >&2 'influxdb init process failed.'
		exit 1
fi
pid="$!"
if ! kill -s TERM "$pid" || ! wait "$pid"; then
		echo >&2 'influxdb init process failed. (Could not stop influxdb)'
		exit 1
fi