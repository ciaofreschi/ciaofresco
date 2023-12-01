terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

provider "google" {
  project = "ciaofresco"
  region  = "eu-west1"
  zone    = "eu-west1-a"
}

resource "google_artifact_registry_repository" "ciaofresco-backend-repo" {
  location      = "europe-west1"
  repository_id = "ciaofresco-backend"
  description   = "Backend for CiaoFresco application"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}