#minikube start --extra-config=apiserver.service-node-port-range=80-60000

#minikube addons enable ingress

kubectl delete -k srcs

eval $(minikube docker-env)
docker build -t custom-nginx:1 ./srcs/nginx/
docker build -t custom-wordpress:1 ./srcs/wordpress/
docker build -t custom-mysql:1 ./srcs/mysql/

kubectl apply -k srcs

minikube dashboard