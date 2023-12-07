# These are permissions that are needed to start a cloud run service
resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

# These are the permission needed for the SQL database
resource "google_project_service" "sqladmin_api" {
  service = "sqladmin.googleapis.com"
}

# Network permissions
resource "google_project_service" "network_api" {
  service = "servicenetworking.googleapis.com"
}

# Secret manager? Why not! Maybe remember to remove the permission after the script has finished
resource "google_project_service" "secretmanager_api" {
    service = "secretmanager.googleapis.com"
}

resource "google_project_service" "cloudrun" {
    service = "run.googleapis.com"
}