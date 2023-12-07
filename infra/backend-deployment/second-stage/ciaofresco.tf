
# To use a private IP with Google Cloud SQL, your VPC network must have a private connection to Google's services set up.
# This is known as a Private Services Access connection.
# But I am not entirely sure of what these component do. More investigation needed.

resource "google_compute_network" "private_network" {
  provider = google

  name = "private-network"

  depends_on = [ google_project_service.compute_api, google_project_service.network_api ]
}


resource "google_compute_global_address" "private_ip_address" {
  provider = google

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.id
  depends_on = [ google_compute_network.private_network ]
}


resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google

  network                 = google_compute_network.private_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


# The Cloud SQL instance
resource "google_sql_database_instance" "ciaofresco-sql" {

  name             = "${var.database_name}"
  region           = "${var.region}"
  database_version = "${var.database_version}"
  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = "${var.database_tier}"
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.private_network.id
      enable_private_path_for_google_cloud_services = true
    }
  }
}

# The user that is going to use our database. We can find it on the Cloud SQL instance page. The root user get deleted by terraform after creation
resource "google_sql_user" "users" {
  name     = "${var.database_user}"
  instance = google_sql_database_instance.ciaofresco-sql.name
  host     = "ciaofresco.com"
  password = "${var.database_password}"
}