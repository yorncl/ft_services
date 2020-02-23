minikube start --extra-config=apiserver.service-node-port-range=80-60000 --cpus 3 --memory=3000mb
minikube addons enable ingress
minikube addons enable metrics-server

kubectl delete -k srcs

eval $(minikube docker-env)
docker build -t custom-nginx:1 ./srcs/nginx/
docker build -t custom-wordpress:1 ./srcs/wordpress/
docker build -t custom-mysql:1 ./srcs/mysql/


kubectl create configmap telegraf-config --from-file=srcs/telegraf/telegraf.conf -o yaml --dry-run | kubectl replace -f - || kubectl create configmap telegraf-config --from-file=srcs/telegraf/telegraf.conf
kubectl apply -k srcs

minikube dashboard