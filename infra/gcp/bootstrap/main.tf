# --- bootstrap/main.tf ---

# Workload Identity Pool
resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = var.wif_pool_id
  display_name              = "GitHub Actions Pool"
  description               = "Identity pool for GitHub Actions across all authorized GitHub organizations"
}

# OIDC Provider — one provider, condition allows any repo in either GitHub org
resource "google_iam_workload_identity_pool_provider" "github_oidc" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = var.wif_provider_id
  display_name                       = "GitHub OIDC Provider"
  description                        = "OIDC provider for GitHub Actions tokens from authorized organizations"

  attribute_mapping = {
    "google.subject"             = "assertion.sub"
    "attribute.actor"            = "assertion.actor"
    "attribute.repository"       = "assertion.repository"
    "attribute.repository_owner" = "assertion.repository_owner"
  }

  # Allow any repository whose owner is one of the two GitHub orgs
  attribute_condition = "attribute.repository_owner in ${jsonencode(var.github_orgs)}"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Bind the service account to the pool — any principal in the pool that
# satisfies the attribute_condition above can impersonate this SA
resource "google_service_account_iam_member" "wif_binding" {
  service_account_id = "projects/${var.gcp_project_id}/serviceAccounts/${var.service_account_email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository_owner/${var.github_orgs[0]}"
}

resource "google_service_account_iam_member" "wif_binding_org2" {
  service_account_id = "projects/${var.gcp_project_id}/serviceAccounts/${var.service_account_email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository_owner/${var.github_orgs[1]}"
}
