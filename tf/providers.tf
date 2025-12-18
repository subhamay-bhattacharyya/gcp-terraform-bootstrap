terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.39.0"
    }
  }
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
