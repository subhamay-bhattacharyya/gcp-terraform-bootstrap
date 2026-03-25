# --- root/outputs.tf ---

output "folder_ids" {
  description = "Map of folder keys to their numeric GCP folder IDs."
  value       = module.gcp_project_hierarchy.folder_ids
}

output "folder_names" {
  description = "Map of folder keys to their full GCP resource names (folders/<id> format)."
  value       = module.gcp_project_hierarchy.folder_names
}

output "project_ids" {
  description = "Map of project keys to their GCP project IDs."
  value       = module.gcp_project_hierarchy.project_ids
}

output "project_numbers" {
  description = "Map of project keys to their GCP project numbers."
  value       = module.gcp_project_hierarchy.project_numbers
}

output "enabled_services" {
  description = "Map of 'project_key/service' to the enabled service name."
  value       = module.gcp_project_hierarchy.enabled_services
}

# output "alert_policy_ids" {
#   description = "Map of project key to list of monitoring alert policy resource names for that project."
#   value       = module.gcp_project_hierarchy.alert_policy_ids
# }

output "notification_channel_ids" {
  description = "Map of project key to email notification channel resource name, for projects that have one configured."
  value       = module.gcp_project_hierarchy.notification_channel_ids
}

output "service_account_emails" {
  description = "Map of project keys to their service account emails, for projects that have a service account configured."
  value       = { for k, sa in google_service_account.this : k => sa.email }
}
