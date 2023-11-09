
resource "google_sql_database_instance" "ciaofresco-db" {
  name                = "ciaofresco-db"
  region              = "europe-west1"
  database_version    = "MYSQL_8_0_31"
  deletion_protection = true

  settings {
    tier              = "db-f1-micro"
    activation_policy = "NEVER"
    availability_type = "ZONAL"
    disk_autoresize   = true
    disk_type         = "PD_SSD"
    disk_size         = 10
    pricing_plan      = "PER_USE"

    location_preference {
      zone = "europe-west1-b"
    }

    backup_configuration {
      binary_log_enabled             = false
      enabled                        = true
      start_time                     = "18:00"
      location                       = "eu"
      transaction_log_retention_days = 7
    }

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = false
      private_network = google_compute_network.vpc_network.self_link
    }


    database_flags {
      name  = "max_connections"
      value = "10"
    }

    insights_config {
      query_insights_enabled  = true
      query_plans_per_minute  = 5
      query_string_length     = 1024
      record_application_tags = true
      record_client_address   = true
    }
  }
}
