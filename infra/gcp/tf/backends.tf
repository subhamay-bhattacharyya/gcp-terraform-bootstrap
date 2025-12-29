# --- root/backend.tf ---

terraform {
  cloud {

    organization = "subhamay-bhattacharyya-projects"

    workspaces {
      name = "gcp-terraform-bootstrap"
    }
  }
}