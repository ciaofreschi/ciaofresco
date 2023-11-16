

sudo dnf install google-cloud-cli

gcloud config set project ciaofresco

gcloud auth configure-docker

gcloud auth configure-docker \
    europe-west1-docker.pkg.dev

eu.gcr.io

docker build . --tag europe-west1-docker.pkg.dev/ciaofresco/ciaofresco-backend/ciaofresco-backend:0.0.1

docker push europe-west1-docker.pkg.dev/ciaofresco/ciaofresco-backend/ciaofresco-backend:0.0.1

terraform fmt