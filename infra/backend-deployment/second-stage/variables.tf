# Remember: vabiales 

variable "project_id" {
  description = "The ID of the Google Cloud Project"
  type        = string
  default = "ciaofresco-test"
}

variable "region" {
  description = "The region where the resources will be deployed"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "The zone where the resources will be deployed"
  type        = string
  default     = "europe-west1-a"
}

# variable "machine_type" {
#   description = "The machine type for the virtual machine"
#   type        = string
#   default     = "n1-standard-1"
# }

# variable "disk_size_gb" {
#   description = "The size of the boot disk in GB"
#   type        = number
#   default     = 10
# }

variable "network" {
  description = "The name of the network"
  type        = string
  default     = "default"
}

variable "subnet" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "backend_image_tag" {
  description = "Docker image tag that will be used on the repository"
  type        = string
  default     = "ciaofresco-backend:0.0.1"
}

variable "database_version" {
  description = "The version of the database"
  type        = string
  default     = "MYSQL_5_7"
}

variable "database_password" {
  description = "The password for the database"
  type        = string
  default     = "ciaofresco"
}

variable "database_name" {
  description = "The name of the database"
  type        = string
  default     = "ciaofresco"
}

variable "database_user" {
  description = "The name of the database user"
  type        = string
  default     = "ciaofresco"
}

variable "database_tier" {
  description = "The tier of the database"
  type        = string
  default     = "db-f1-micro"
}

