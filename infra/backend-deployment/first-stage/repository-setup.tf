terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}


provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}


resource "google_artifact_registry_repository" "ciaofresco-backend-repo" {
  provider      = google
  location      = var.region
  repository_id = "ciaofresco-backend"
  description   = "Backend for CiaoFresco application"
  format        = "DOCKER"

  depends_on = [ google_project_service.services ]

  docker_config {
    immutable_tags = true
  }
}

# europe-west1-docker.pkg.dev/ciaofresco-test/ciaofresco-backend

# HOST NAME = europe-west1-docker.pkg.dev
# PROJECT ID = ciaofresco-test
# REPOSITORY NAME = ciaofresco-backend
# IMAGE NAME = ciaofresco-backend
# IMAGE TAG = 0.0.1
# docker tag ciaofresco-backend:latest europe-west1-docker.pkg.dev/ciaofresco-test/ciaofresco-backend/ciaofresco-backend:0.0.1
# docker push europe-west1-docker.pkg.dev/ciaofresco-test/ciaofresco-backend/ciaofresco-backend:0.0.1
# docker pull europe-west1-docker.pkg.dev/ciaofresco-test/ciaofresco-backend/ciaofresco-backend:0.0.1
# docker run -p 8080:8080 europe-west1-docker.pkg.dev/ciaofresco-test/ciaofresco-backend/ciaofresco-backend:0.0.1
# europe-west1-docker.pkg.dev /ciaofresco-test/ ciaofresco-backend / ciaofresco-backend:0.0.1
