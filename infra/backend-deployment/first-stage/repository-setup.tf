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


resource "google_artifact_registry_repository" "ciaofresco-backend-repo" {
  provider      = google
  location      = var.region
  repository_id = "ciaofresco-backend"
  description   = "Backend for CiaoFresco application"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}
