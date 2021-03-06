if [[ -n  "$1" ]] && [[ "$1" == "stop" ]];
then
	minikube stop
	exit 0
fi

if [[ -n  "$1" ]] && [[ "$1" == "restart" ]];
then
	minikube stop
fi

if [[ -n  "$1" ]] && [[ "$1" == "start" || "$1" == "restart" ]];
then
minikube start \
	--bootstrapper=kubeadm \
	--extra-config=apiserver.service-node-port-range=1-60000 \
	--cpus 3 \
	--memory=3000mb \
	--vm-driver=virtualbox

minikube addons enable ingress
minikube addons enable metrics-server
minikube addons enable dashboard
fi

IP_MINIKUBE=$(minikube ip)
# IP_MINIKUBE="192.168.99.130"
echo "Starting on $IP_MINIKUBE"

kubectl delete -k srcs

eval $(minikube docker-env)
docker build -t custom-nginx:1 ./srcs/nginx/
docker build -t custom-wordpress:1 ./srcs/wordpress/
docker build -t custom-phpmyadmin:1 ./srcs/phpmyadmin/
docker build -t custom-influxdb:1 ./srcs/influxdb/
docker build -t custom-grafana:1 ./srcs/grafana/

docker build -t custom-mysql:1 --build-arg minikube_ip=$IP_MINIKUBE ./srcs/mysql/
docker build -t custom-ftps:1 --build-arg minikube_ip=$IP_MINIKUBE ./srcs/ftps/
docker build -t custom-telegraf:1 --build-arg minikube_ip=$IP_MINIKUBE ./srcs/telegraf/


kubectl create configmap grafana-datasources-config --from-file=srcs/grafana/datasource.yaml -o yaml --dry-run | kubectl replace -f - || kubectl create configmap grafana-datasources-config --from-file=srcs/grafana/datasource.yaml
kubectl create configmap grafana-dashboards-config --from-file=srcs/grafana/dashboards/ -o yaml --dry-run | kubectl replace -f - || kubectl create configmap grafana-dashboards-config --from-file=srcs/grafana/dashboards/
kubectl apply -k srcs

minikube dashboard