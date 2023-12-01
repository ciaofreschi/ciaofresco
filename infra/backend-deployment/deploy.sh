#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to the first Terraform script directory
cd first-stage
echo "Applying first Terraform script..."
terraform init
terraform apply -auto-approve

# Navigate to Dockerfile directory and build/deploy Docker image
cd ../../../backend
echo "Building Docker image..."
docker build -t europe-west1-docker.pkg.dev/ciaofresco/ciaofresco-backend/ciaofresco-backend:0.0.1 .
echo "Deploying Docker image..."
# For example, pushing to a registry
docker push europe-west1-docker.pkg.dev/ciaofresco/ciaofresco-backend/ciaofresco-backend:0.0.1

# Navigate to the second Terraform script directory
cd ../infra/backend-deployment/second-stage
echo "Applying second Terraform script..."
terraform init
terraform apply -auto-approve

echo "Deployment complete!"
