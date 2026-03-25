# --- root/main.tf ---

module "gcp_project_hierarchy" {
  source = "github.com/subhamay-bhattacharyya-tf/terraform-google-project-hierarchy?ref=main"

  organization_id  = var.organization_id
  hierarchy_config = jsondecode(file("${path.module}/${var.hierarchy_config_file}"))
}
