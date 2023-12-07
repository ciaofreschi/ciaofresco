# These are needed for the artifact registry creation
resource "google_project_service" "gcp_resource_manager_api" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "time_sleep" "gcp_wait_crm_api_enabling" {
  depends_on = [
    google_project_service.gcp_resource_manager_api
  ]

  create_duration = "1m"
}

variable "services" {
  type = list(string)
  default = ["iam.googleapis.com", "artifactregistry.googleapis.com"]
}

resource "google_project_service" "services" {
  for_each = toset(var.services)
  project = "${var.project_id}"
  service = each.value
  depends_on = [ time_sleep.gcp_wait_crm_api_enabling ]
}