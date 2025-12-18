# --- root/main.tf ---

# --- bootstrap/main.tf ---

locals {
  # Flatten role bindings into a stable map for for_each
  # Key format: "<sa_key>::<role>"
  project_iam_bindings = {
    for b in flatten([
      for sa_key, sa in var.service_accounts : [
        for role in sa.project_roles : {
          key    = "${sa_key}::${role}"
          sa_key = sa_key
          role   = role
        }
      ]
    ]) : b.key => b
  }
}

resource "google_project_service" "this" {
  for_each           = var.required_apis
  project            = var.gcp_project_id
  service            = each.value
  disable_on_destroy = false
}

# # 2) Create service accounts (repo/project-specific)
# resource "google_service_account" "this" {
#   for_each     = var.service_accounts
#   project      = var.gcp_project_id
#   account_id   = each.value.account_id
#   display_name = each.value.display_name

#   depends_on = [google_project_service.required]
# }

# # 3) Grant project-level roles to each service account
# resource "google_project_iam_member" "sa_roles" {
#   for_each = local.project_iam_bindings

#   project = var.gcp_project_id
#   role    = each.value.role
#   member  = "serviceAccount:${google_service_account.this[each.value.sa_key].email}"
# }
