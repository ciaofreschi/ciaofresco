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

resource "google_artifact_registry_repository" "ciaofresco-backend-repo" {
  location      = "europe-west1"
  repository_id = "ciaofresco-backend"
  description   = "Backend for CiaoFresco application"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}


resource "google_cloud_run_v2_service" "default" {
  name     = "ciaofresco-backend"
  location = "europe-west1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = 2
    }

    volumes {
      name = "cloudsql"
      cloud_sql_instance {
        instances = [google_sql_database_instance.ciaofresco-db.connection_name]
      }
    }
    containers {
      image = "europe-west1-docker.pkg.dev/ciaofresco/ciaofresco-backend/ciaofresco-backend:0.0.1"

      volume_mounts {
        name       = "cloudsql"
        mount_path = "/cloudsql"
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_v2_service.default.location
  project  = google_cloud_run_v2_service.default.project
  service  = google_cloud_run_v2_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

