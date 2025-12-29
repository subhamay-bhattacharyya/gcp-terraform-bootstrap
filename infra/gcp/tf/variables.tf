# --- root/variables.tf ---

variable "gcp_project_id" { type = string }
variable "gcp_region" { type = string }
# variable "gcp_credentials_file_path" { type = string }

variable "required_apis" {
  type = set(string)
}

# Data-driven SA definitions (dynamic)
variable "service_accounts" {
  type = map(object({
    account_id    = string
    display_name  = string
    project_roles = set(string)
  }))
}
