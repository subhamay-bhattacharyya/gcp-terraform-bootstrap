# --- bootstrap/backends.tf ---

terraform {
  cloud {

    organization = "subhamay-bhattacharyya-projects"

    workspaces {
      name = "gcp-wif-bootstrap"
    }
  }
}
