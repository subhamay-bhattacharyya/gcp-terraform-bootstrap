# --- bootstrap/variables.tf ---

variable "gcp_project_id" {
  description = "GCP project ID where WIF resources will be created"
  type        = string
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
}

variable "gcp_credentials_file_path" {
  description = "Path to the GCP service account JSON credentials file"
  type        = string
}

variable "wif_pool_id" {
  description = "ID for the Workload Identity Pool"
  type        = string
  default     = "github-actions-pool"
}

variable "wif_provider_id" {
  description = "ID for the Workload Identity Pool OIDC Provider"
  type        = string
  default     = "github-oidc-provider"
}

variable "github_orgs" {
  description = "List of GitHub organization names allowed to authenticate via WIF"
  type        = list(string)
}

variable "service_account_email" {
  description = "Email of the GCP service account that GitHub Actions will impersonate"
  type        = string
}
