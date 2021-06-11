minikube start --vm-driver=virtualbox  --disk-size="10000mb" --memory="4000mb"

minikube addons enable metallb

eval $(minikube docker-env)

kubectl apply -f ./srcs/yaml/configmap.yaml

docker build -t wordpress_image ./srcs/wordpress
docker build -t nginx_image ./srcs/nginx
docker build -t php_image ./srcs/php
docker build -t mysql_image ./srcs/mysql
docker build -t ftps_image ./srcs/ftps
docker build -t grafana_image ./srcs/grafana
docker build -t influxdb_image ./srcs/influxdb


kubectl apply -f ./srcs/yaml/nginx.yaml
kubectl apply -f ./srcs/yaml/wordpress.yaml
kubectl apply -f ./srcs/yaml/php.yaml
kubectl apply -f ./srcs/yaml/mysql.yaml
kubectl apply -f ./srcs/yaml/ftps.yaml
kubectl apply -f ./srcs/yaml/grafana.yaml
kubectl apply -f ./srcs/yaml/influxdb.yaml
