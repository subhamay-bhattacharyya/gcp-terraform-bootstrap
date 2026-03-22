# --- bootstrap/outputs.tf ---

output "wif_pool_name" {
  description = "Full resource name of the Workload Identity Pool"
  value       = google_iam_workload_identity_pool.github.name
}

output "wif_provider_name" {
  description = "Full resource name of the WIF OIDC Provider — use this as the GCP_WIF_PROVIDER GitHub secret"
  value       = google_iam_workload_identity_pool_provider.github_oidc.name
}
