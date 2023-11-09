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

#google_compute_network.vpc_network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network" # [a-z]([-a-z0-9]*[a-z0-9])?
}

resource "google_cloud_run_service" "default" {
  name     = "ciaofresco-backend"
  location = "eu-west1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "1000"
        "run.googleapis.com/cloudsql-instances" = google_sql_database_instance.ciaofresco-db.connection_name
        "run.googleapis.com/client-name"        = "terraform"
      }
    }
  }
  autogenerate_revision_name = true
}

