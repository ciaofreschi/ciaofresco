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

resource "google_cloud_run_v2_service" "ciaofresco_backend" {
  name     = "ciaofresco-backend"
  location = "europe-west1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  depends_on = [ google_project_service.cloudrun ]

  template {
    scaling {
      max_instance_count = 2
    }

    volumes {
      name = "cloudsql"
      cloud_sql_instance {
        instances = [google_sql_database_instance.ciaofresco-sql.connection_name]
      }
    }
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/ciaofresco-backend/${var.backend_image_tag}"

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

# Fa da join
resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_v2_service.ciaofresco_backend.location
  project  = google_cloud_run_v2_service.ciaofresco_backend.project
  service  = google_cloud_run_v2_service.ciaofresco_backend.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
 


# Output cloud run url
 