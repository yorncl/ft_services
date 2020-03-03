
if [[ -n  "$1" ]] && [[ "$1" == "start" ]];
then

# sed -i "s/{{{MINIKUBE_IP}}}/$ip/g" srcs/mysql/create_tables.sql
# sed -i "s/{{{MINIKUBE_IP}}}/$ip/g" srcs/ftps/vsftpd.conf


minikube start \
	--bootstrapper=kubeadm \
	--extra-config=apiserver.service-node-port-range=1-60000 \
	--cpus 3 \
	--memory=3000mb \
	--vm-driver=virtualbox\
	# --disk-size=80000mb \
minikube addons enable ingress
minikube addons enable metrics-server
minikube addons enable dashboard
fi

# $ip = $(minikube ip)
$ip = "192.168.99.128"
echo "Starting on $ip"

kubectl delete -k srcs

eval $(minikube docker-env)
# docker build -t custom-nginx:1 ./srcs/nginx/
# docker build -t custom-wordpress:1 ./srcs/wordpress/
# docker build -t custom-phpmyadmin:1 ./srcs/phpmyadmin/
docker build -t custom-influxdb:1 ./srcs/influxdb/

# docker build -t custom-mysql:1 ./srcs/mysql/
# docker build -t custom-ftps:1 ./srcs/ftps/
# docker build -t custom-telegraf:1 --build-arg minikube_ip=$ip ./srcs/telegraf/


# kubectl create configmap telegraf-config --from-file=srcs/telegraf/telegraf.conf -o yaml --dry-run | kubectl replace -f - || kubectl create configmap telegraf-config --from-file=srcs/telegraf/telegraf.conf
kubectl create configmap grafana-datasources-config --from-file=srcs/grafana/datasource.yaml -o yaml --dry-run | kubectl replace -f - || kubectl create configmap grafana-datasources-config --from-file=srcs/grafana/datasource.yaml
kubectl create configmap grafana-dashboards-config --from-file=srcs/grafana/dashboards/ -o yaml --dry-run | kubectl replace -f - || kubectl create configmap grafana-dashboards-config --from-file=srcs/grafana/dashboards/
kubectl apply -k srcs

minikube dashboard