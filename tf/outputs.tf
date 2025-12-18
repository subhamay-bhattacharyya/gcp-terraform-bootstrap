# --- root/main.tf ---

# output "tf_executor_sa_email" {
#   value = google_service_account.sa["tf_executor"].email
# }

# output "composer_runtime_sa_email" {
#   value = google_service_account.sa["composer_runtime"].email
# }

output "project_iam_bindings" {
  value = local.project_iam_bindings
}