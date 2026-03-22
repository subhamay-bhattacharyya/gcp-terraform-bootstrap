# --- root/variables.tf ---

variable "gcp_project_id" { type = string }
variable "gcp_region" { type = string }

variable "gcp_credentials_file_path" {
  description = "Path to the GCP service account JSON credentials file."
  type        = string
}

variable "organization_id" {
  description = "GCP Organization ID."
  type        = string
}

variable "billing_account" {
  description = "GCP Billing Account ID."
  type        = string
}

variable "hierarchy_config_file" {
  description = "Path to the hierarchy JSON configuration file."
  type        = string
}
