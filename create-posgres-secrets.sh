#!/bin/bash

# Load variables from .env file
set -a
source .env
set +a

# Create the YAML file
cat <<EOF > ./k8s/postgres-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: postgres-secret
type: Opaque
data:
  POSTGRES_USER: $(echo -n "$POSTGRES_USER" | base64)
  POSTGRES_PASSWORD: $(echo -n "$POSTGRES_PASSWORD" | base64)
  POSTGRES_DB: $(echo -n "$POSTGRES_DB" | base64)
EOF