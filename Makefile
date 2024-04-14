include .env

docker_build: 
	docker build -t ${DOCKER_NAME} docker/
	docker tag ${DOCKER_NAME} ${USER}/${DOCKER_NAME}
	docker push ${USER}/${DOCKER_NAME}

minikube_start:
	minikube start

minikube_stop:
	minikube stop

please_wait:
	echo "Need to wait a moment"
	sleep 15

please_wait_longer:
	echo "Need to wait a moment for cluster to be ready"
	sleep 30

k8s_start:
	kubectl apply -f kubernetes/namespace.yml
	kubectl apply -f kubernetes/deployment.yml
	kubectl apply -f kubernetes/service.yml
	kubectl apply -f kubernetes/ingress.yml

helm_start:
	helm install my-nginx ./helm

azure_start:
	cd terraform && terraform init
	cd terraform && terraform apply
	cd terraform && terraform output -raw kube_config > aks_kubeconfig
	export KUBECONFIG=terraform/aks_kubeconfig

azure_helm_start:
	helm install my-nginx ./terraform/helm

k8s_test:
	curl http://rekrutacja.local

k8s_stop:
	kubectl delete -f kubernetes/ingress.yml
	kubectl delete -f kubernetes/service.yml
	kubectl delete -f kubernetes/deployment.yml
	kubectl delete -f kubernetes/namespace.yml

helm_stop:
	helm uninstall my-nginx

azure_stop: helm_stop
	cd terraform && terraform init
	cd terraform && terraform destroy

k8s_run: k8s_start please_wait k8s_test k8s_stop

helm_run: helm_start please_wait k8s_test helm_stop

k8s_full: minikube_start please_wait please_wait_longer k8s_start please_wait k8s_test k8s_stop minikube_stop

helm_full: minikube_start please_wait please_wait_longer helm_start please_wait_longer k8s_test helm_stop minikube_stop
