# A little project wihich lets you run Apache Answer server with k8s

## How to work with Docker

```bash
# How to run colima docker daemon
limactl start
limactl stop

docker-compose -f ./docker-compose.yaml up
```

## How to run k8s

```bash
# Start minikube
minikube start

# Claster info
kubectl get po -A

# Open web UI dashboard if you need
minikube dashboard
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
