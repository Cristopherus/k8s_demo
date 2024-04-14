# Rekrutacja
## Simple webservice demo

## Prerequisites
Please make sure that you have installed:
- kubernetes
- helm
- minikube
- make

To deploy with azure please also do
```sh
az login --use-device-code
az account show --subscription <subscription_name> --query id
az ad sp create-for-rbac - name <service_principal_name> - role Contributor - scopes /subscriptions/<subscription_id>
```

Next create `.credentials.env` file
```sh
export ARM_CLIENT_ID="xxx" <appID>
export ARM_CLIENT_SECRET="xxx" <Password>
export ARM_SUBSCRIPTION_ID="xxx" <SubscriptionID>
export ARM_TENANT_ID="xxx" <TenantID>
```
and run `source .credentials.env`

## Pure k8s
Prepare local cluster with `make minikube_start`
Create webservice, test it and destroy with `make k8s_run`
or do each step manually
```sh
make k8s_start
make k8s_test
make k8s_stop
```
Cluster can be destroyed with `make minikube_stop`

## Helm
Prepare local cluster with `make minikube_start`
Create webservice, test it and destroy with `make helm_run`
or do each step manually
```sh
make helm_start
make helm_test
make helm_stop
```
Cluster can be destroyed with `make minikube_stop`

## Azure & terraform
Create AKS cluster with `make azure_start`
Deploy helm with `make azure_helm_start`
Go to Azure webpage to get _External IP_ and check if webservice is working
Destroy AKS cluster with `make azure_stop`

