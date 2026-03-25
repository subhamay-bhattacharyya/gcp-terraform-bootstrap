# --- root/service_accounts.tf ---

locals {
  hierarchy_config = jsondecode(file("${path.module}/${var.hierarchy_config_file}"))

  projects_with_sa = {
    for k, v in local.hierarchy_config.projects :
    k => v.service_account
    if try(v.service_account.enabled, false)
  }

  sa_role_bindings = {
    for item in flatten([
      for proj_key, sa in local.projects_with_sa : [
        for role in try(sa.project_roles, []) : {
          key      = "${proj_key}/${role}"
          proj_key = proj_key
          role     = role
        }
      ]
    ]) : item.key => item
  }
}

resource "google_service_account" "this" {
  for_each = local.projects_with_sa

  project      = module.gcp_project_hierarchy.project_ids[each.key]
  account_id   = each.value.account_id
  display_name = try(each.value.display_name, each.value.account_id)
}

resource "google_project_iam_member" "sa_roles" {
  for_each = local.sa_role_bindings

  project = module.gcp_project_hierarchy.project_ids[each.value.proj_key]
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.this[each.value.proj_key].email}"
}
