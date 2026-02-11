# --- root/main.tf ---



# 1) Create ONE service account per repo (in the identity project)
resource "google_service_account" "repo_sa" {
  for_each = var.repos

  project      = each.value.identity_project_id
  account_id   = each.value.service_account_id
  display_name = coalesce(try(each.value.display_name, null), "Terraform SA for ${each.key}")
  description  = "Service account dedicated to GitHub repo: ${each.key}"
}

# # 2) Enable APIs in the TARGET project (per repo)
# resource "google_project_service" "repo_apis" {
#   for_each = {
#     for item in flatten([
#       for repo, cfg in var.repos : [
#         for api in try(cfg.enabled_apis, []) : {
#           k          = "${repo}::${cfg.target_project_id}::${api}"
#           repo       = repo
#           project_id = cfg.target_project_id
#           api        = api
#         }
#       ]
#     ]) : item.k => item
#   }

#   project            = each.value.project_id
#   service            = each.value.api
#   disable_on_destroy = false
# }

# # 3) Grant IAM roles (project-level) to that repo's SA in the TARGET project
# resource "google_project_iam_member" "repo_project_roles" {
#   for_each = {
#     for item in flatten([
#       for repo, cfg in var.repos : [
#         for role in try(cfg.project_roles, []) : {
#           k          = "${repo}::${cfg.target_project_id}::${role}"
#           repo       = repo
#           project_id = cfg.target_project_id
#           role       = role
#         }
#       ]
#     ]) : item.k => item
#   }

#   project = each.value.project_id
#   role    = each.value.role
#   member  = "serviceAccount:${google_service_account.repo_sa[each.value.repo].email}"

#   depends_on = [google_project_service.repo_apis]
# }


#####################################

# locals {
#   # Flatten role bindings into a stable map for for_each
#   # Key format: "<sa_key>::<role>"
#   project_iam_bindings = {
#     for b in flatten([
#       for sa_key, sa in var.service_accounts : [
#         for role in sa.project_roles : {
#           key    = "${sa_key}::${role}"
#           sa_key = sa_key
#           role   = role
#         }
#       ]
#     ]) : b.key => b
#   }
# }

# # 1) Enable required APIs
# resource "google_project_service" "this" {
#   for_each           = var.required_apis
#   project            = var.gcp_project_id
#   service            = each.value
#   disable_on_destroy = false
# }

# # 2) Create service accounts (repo/project-specific)
# resource "google_service_account" "this" {
#   for_each     = var.service_accounts
#   project      = var.gcp_project_id
#   account_id   = each.value.account_id
#   display_name = each.value.display_name

#   depends_on = [google_project_service.this]
# }

# # 3) Grant project-level roles to each service account
# resource "google_project_iam_member" "this" {
#   for_each = local.project_iam_bindings

#   project = var.gcp_project_id
#   role    = each.value.role
#   member  = "serviceAccount:${google_service_account.this[each.value.sa_key].email}"
# }
