#!/bin/bash



# Export terraform variables
export TF_VAR_project_id="ciaofresco"
export TF_VAR_region="europe-west1"
export TF_VAR_zone="europe-west1-b"
export TF_VAR_backend_image_tag="ciaofresco-backend:0.0.1"

# Set gcloud project
gcloud config set project ${TF_VAR_project_id}

# Check if the service account exists
if gcloud iam service-accounts list | grep -q terraform-account@${TF_VAR_project_id}.iam.gserviceaccount.com; then
    echo "Service account already exists"
else
    echo "Service account does not exist"

    # Creating service account
    gcloud iam service-accounts create terraform-account --display-name "Terraform account"

    # Assigning policies
    gcloud projects add-iam-policy-binding $TF_VAR_project_id --member="serviceAccount:terraform-account@${TF_VAR_project_id}.iam.gserviceaccount.com" --role="roles/editor"

    # Add permission roles/servicenetworking.networksAdmin
    gcloud projects add-iam-policy-binding $TF_VAR_project_id --member="serviceAccount:terraform-account@${TF_VAR_project_id}.iam.gserviceaccount.com" --role="roles/servicenetworking.networksAdmin"

    # Add permission setIamPolicy to cloud run allow policy
    gcloud projects add-iam-policy-binding $TF_VAR_project_id --member="serviceAccount:terraform-account@${TF_VAR_project_id}.iam.gserviceaccount.com" --role="roles/run.admin"

    gcloud projects add-iam-policy-binding $TF_VAR_project_id --member="serviceAccount:sa-terraform@${TF_VAR_project_id}.iam.gserviceaccount.com" --role="roles/storage.admin"

    gcloud projects add-iam-policy-binding $TF_VAR_project_id --member="serviceAccount:sa-terraform@${TF_VAR_project_id}.iam.gserviceaccount.com" --role="roles/storage.objectAdmin"
  gcloud projects add-iam-policy-binding ciaofresco --member="serviceAccount:sa-terraform@${TF_VAR_project_id}.iam.gserviceaccount.com"  --role='roles/serviceusage.serviceUsageAdmin'
fi

# Enable this service othewise Terraform will fail
gcloud services enable storage.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
# This step may work only on linux
gcloud auth configure-docker ${TF_VAR_region}-docker.pkg.dev

# Check if file exists
if [ -f ~/terraform-account-key.json ]; then
    echo "File exists"
else
    echo "File does not exist"
     # Creating service account key
    gcloud iam service-accounts keys create ~/terraform-account-key.json --iam-account=terraform-account@${TF_VAR_project_id}.iam.gserviceaccount.com
fi

# Exporting service account key
export GOOGLE_APPLICATION_CREDENTIALS=~/terraform-account-key.json

# Exit immediately if a command exits with a non-zero status
set -e

# If a flag --clear is applied, clear both terraform configurations
if [ "$1" == "--clear" ]; then
    echo "Clearing Terraform configurations..."
    cd first-stage
    terraform destroy -auto-approve
    cd ../second-stage
    terraform destroy -auto-approve
fi

# Navigate to the first Terraform script directory
cd first-stage
echo "Applying first Terraform script..."
terraform init
terraform apply -auto-approve

# Navigate to Dockerfile directory and build/deploy Docker image
cd ../../../backend
echo "Building Docker image..."
docker build -t ${TF_VAR_region}-docker.pkg.dev/${TF_VAR_project_id}/ciaofresco-backend/${TF_VAR_backend_image_tag} .
echo "Deploying Docker image..."
# For example, pushing to a registry
docker push ${TF_VAR_region}-docker.pkg.dev/${TF_VAR_project_id}/ciaofresco-backend/${TF_VAR_backend_image_tag}

# Navigate to the second Terraform script directory
cd ../infra/backend-deployment/second-stage
echo "Applying second Terraform script..."
terraform init
terraform apply -auto-approve

echo "Deployment complete!"
