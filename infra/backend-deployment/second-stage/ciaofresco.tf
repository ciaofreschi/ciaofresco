
# To use a private IP with Google Cloud SQL, your VPC network must have a private connection to Google's services set up.
# This is known as a Private Services Access connection.

resource "google_compute_network" "private_network" {
  provider = google

  name = "private-network"
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.id
}


resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google

  network                 = google_compute_network.private_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_sql_database_instance" "ciaofresco-sql" {

  name             = "ciaofresco-sql"
  region           = "europe-west1"
  database_version = "MYSQL_5_7"

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.private_network.id
      enable_private_path_for_google_cloud_services = true
    }
  }
}


resource "google_sql_user" "users" {
  name     = "user"
  instance = google_sql_database_instance.ciaofresco-sql.name
  host     = "ciaofresco.com"
  password = "user"
}