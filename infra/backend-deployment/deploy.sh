#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set env variables
# if [ -z "$GOOGLE_APPLICATION_CREDENTIALS" ]; then
#     echo "GOOGLE_APPLICATION_CREDENTIALS is not set"
# elif [ -z "$GOOGLE_PROJECT_ID" ]; then
#     export GOOGLE_APPLICATION_CREDENTIALS=../../credentials.json\
# fi

# If a flag --clear is applied, clear both terraform configurations
if [ "$1" == "--clear" ]; then
    echo "Clearing Terraform configurations..."
    cd first-stage
    terraform destroy -auto-approve
    cd ../second-stage
    terraform destroy -auto-approve
fi

# Export terraform variables
export TF_VAR_project_id="ciaofresco-test"
export TF_VAR_region="europe-west1"
export TF_VAR_zone="europe-west1-b"
export TF_VAR_backend_image_tag="ciaofresco-backend:0.0.1"


# Navigate to the first Terraform script directory
cd first-stage
echo "Applying first Terraform script..."
terraform init
terraform apply -auto-approve

# Navigate to Dockerfile directory and build/deploy Docker image
cd ../../../backend
echo "Building Docker image..."
docker build -t ${TF_VAR_region}-docker.pkg.dev/${TF_VAR_project_id}/${TF_VAR_backend_image_tag} .
echo "Deploying Docker image..."
# For example, pushing to a registry
docker push ${TF_VAR_region}-docker.pkg.dev/${TF_VAR_project_id}/${TF_VAR_backend_image_tag}

# Navigate to the second Terraform script directory
cd ../infra/backend-deployment/second-stage
echo "Applying second Terraform script..."
terraform init
terraform apply -auto-approve

echo "Deployment complete!"
