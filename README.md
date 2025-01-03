# A little project wihich lets you run Apache Answer server with k8s

## How it looks

The main page
<img width="1511" alt="Screenshot 2024-11-08 at 02 05 10" src="https://github.com/user-attachments/assets/7b9bcf52-0750-4ce3-a86e-9a054e41e9ec">

A question page
<img width="1511" alt="Screenshot 2024-11-08 at 02 05 17" src="https://github.com/user-attachments/assets/b9222e38-73f9-4706-b1e5-d36df390d433">

## Deployment 

### Beforehand

Create .env file with your own values for postgres username, password and db name in the format:
```
POSTGRES_USER=some_username
POSTGRES_PASSWORD=some_password
POSTGRES_DB=some_db_name
```

### How to work with Docker

```bash
# Start lima docker daemon
limactl start

docker-compose -f ./docker-compose.yaml up

# Stop after use
limactl stop
```

### How to run k8s

```bash
# Start minikube
minikube start

# Claster info
kubectl get po -A

# Open web UI dashboard if you need
minikube dashboard

# Stop minikube
minikube stop
```

Generate k8s secrets file
```bash
./create-posgres-secrets.sh
```

Deploy k8s resources
```bash
kubectl apply -f k8s/postgres-secret.yaml
kubectl apply -f k8s/pvc.yaml
kubectl apply -f k8s/answer-deployment.yaml
kubectl apply -f k8s/postgres-deployment.yaml
```

### To connect to Answers service

```bash
kubectl port-forward svc/answer-service 8080:8080

minikube tunnel
minikube service answer-service --url
```

### Default setup for apache answer

DB Host 
`postgres-service:5432`


### Base64 PG data

```bash
echo -n "some_value" | base64
```

## Info 

The default path for config file 
`/data/conf/config.yaml`

## How to create a backup

```bash
# Install kubectl krew - https://krew.sigs.k8s.io/docs/user-guide/setup/install/
# Update krew index
kubectl krew update
# Install kubectl-neat
kubectl krew install neat

# pass kubectl resources output through kubectl neat
kubectl get all -o yaml | kubectl neat > neat_cleaned.yaml
```

## How to delete a eks cluster

```bash
export CLUSTER_NAME=little-app-cluster
aws eks delete cluster --name $CLUSTER_NAME
aws eks describe-cluster --name $CLUSTER_NAME

aws eks list-nodegroups --cluster-name $CLUSTER_NAME
aws eks delete-nodegroup --cluster-name $CLUSTER_NAME --nodegroup-name ng-cb10495f
ng-cb10495f

# Scale down a node group
aws eks update-nodegroup-config \
  --cluster-name $CLUSTER_NAME \
  --nodegroup-name ng-cb10495f \
  --scaling-config minSize=0,maxSize=1,desiredSize=0 
```

Delete with eksctl
```bash
eksctl delete cluster --name $CLUSTER_NAME
```