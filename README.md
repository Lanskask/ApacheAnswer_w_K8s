# A little project wihich lets you run Apache Answer server with k8s

## Before use

Create .env file with your own values for postgres username, password and db name in the format:
```
POSTGRES_USER=some_username
POSTGRES_PASSWORD=some_password
POSTGRES_DB=some_db_name
```

## How to work with Docker

```bash
# Start lima docker daemon
limactl start

docker-compose -f ./docker-compose.yaml up

# Stop after use
limactl stop
```

## How to run k8s

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

## Default setup for apache answer

DB Host 
`postgres-service:5432`


## Base64 PG data

```bash
echo -n "some_value" | base64
```
