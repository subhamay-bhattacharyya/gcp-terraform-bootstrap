# --- root/main.tf ---

output "project_iam_bindings" {
  value = local.project_iam_bindings
}

output "enabled_apis" {
  value = [for s in google_project_service.this : s.service]
}

output "service_account_emails" {
  value = { for sa_key, sa in google_service_account.this : sa_key => sa.email }
}

output "project_iam_memberships" {
  value = {
    for binding_key, binding in google_project_iam_member.this :
    binding_key => {
      role   = binding.role
      member = binding.member
    }
  }
}