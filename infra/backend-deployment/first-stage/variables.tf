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
