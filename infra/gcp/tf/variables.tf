# --- root/variables.tf ---

variable "gcp_project_id" { type = string }
variable "gcp_region" { type = string }
# variable "gcp_credentials_file_path" { type = string }

# variable "required_apis" {
#   type = set(string)
# }

# # Data-driven SA definitions (dynamic)
# variable "service_accounts" {
#   type = map(object({
#     account_id    = string
#     display_name  = string
#     project_roles = set(string)
#   }))
# }


variable "repos" {
  description = "Map keyed by GitHub repo name; creates one SA per repo and applies APIs + IAM in target projects."
  type = map(object({
    identity_project_id = string
    target_project_id   = string
    service_account_id  = string
    display_name        = optional(string)
    enabled_apis        = optional(list(string), [])
    project_roles       = optional(list(string), [])
  }))
}
