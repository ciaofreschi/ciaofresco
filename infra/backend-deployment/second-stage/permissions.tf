# These are permissions that are needed to start a cloud run service
resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

# These are the permission needed for the SQL database
resource "google_project_service" "sqladmin_api" {
  service = "sqladmin.googleapis.com"
}

# These are needed for the artifact registry creation
resource  "google_project_service" "artifact_api" {
    service = "artifactregistry.googleapis.com"
}

# Secret manager? Why not! Maybe remember to remove the permission after the script has finished
resource "google_project_service" "secretmanager_api" {
    service = "secretmanager.googleapis.com"
}