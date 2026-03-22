## [unreleased]

### ⚙️ Miscellaneous Tasks

- Update variable descriptions for consistency and fix secret references in workflow
## [Rel-004-20260322013337] - 2026-03-22

### 📚 Documentation

- Update CHANGELOG.md [skip ci]

### ⚙️ Miscellaneous Tasks

- Refactor CI/CD workflows and consolidate Terraform infrastructure
- Update CI workflow paths and Terraform directory configuration
- Add manual workflow dispatch trigger to CI pipeline
- Update GCP Terraform CI workflow configuration
- Update Terraform variables file reference in CI workflow
- Enhance README and update Terraform configurations for GCP deployment
- Enhance main.tf by adding default billing account to GCP project hierarchy module
- Add initial Terraform configuration for GCP Workload Identity Federation
- Update GCP secrets to use variables for workload identity provider and service account
- Refine CI workflow paths for GCP integration
- Update descriptions in variables.tf for consistency
- Update variable descriptions in variables.tf for consistency
## [Rel-003-20251229194748] - 2025-12-29

### 🚀 Features

- Initial release of GCP Terraform bootstrap workflow and configuration
- Add Terraform linting job to GitHub Actions workflow
- Add Terraform Plan step to GitHub Actions workflow
- Enable required Google APIs in main.tf and define required_apis variable in variables.tf
- Add Terraform Validate job to workflow
- Update workflow configurations for cloud deployment and destroy processes
- Implement initial Terraform workflows and configurations for GCP deployment
- Add initial Terraform configuration for GCP infrastructure

### 🐛 Bug Fixes

- Update working directory in GitHub Actions workflow and correct GCP project ID in Terraform variables
- Correct workflow name and update project ID in README for clarity
- Update required Terraform version and comment out unused variable in variables.tf
- Update Terraform Cloud organization and workspace values in workflow
- Remove quotes from Terraform Cloud organization and workspace values in workflow
- Comment out Terraform Cloud organization and workspace values in workflow
- Rename google_project_service resource from 'required' to 'this' in main.tf
- Update Terraform Plan action to use stable version v1.1.0
- Add missing cloud-provider parameter to Terraform Plan step
- Update Terraform Plan action to use version v1.2.0
- Update Slack notification workflow reference to use main branch
- Update custom endpoint in README badges
- Update project name and URLs in package.json and package-lock.json
- Update GitHub Actions workflow to correct usage reference
- Remove unused gcp_credentials_file_path variable from configuration
- Standardize formatting of provider configuration in Terraform

### 💼 Other

- *(deps)* Bump actions/checkout from 4 to 6
- *(deps)* Bump google-github-actions/auth from 2 to 3

### 🚜 Refactor

- Reorganize Terraform Plan workflow and remove GCP authentication step

### 📚 Documentation

- Update README with attribute condition for GitHub OIDC provider
- Enhance README with formatting for Google Cloud CLI authentication step

### ⚙️ Miscellaneous Tasks

- Remove bootstrap reference from main.tf and organize provider configurations in providers.tf
- Remove redundant Terraform Plan job configuration from workflow
- Sync package-lock with package.json
- Remove semantic release configuration and related scripts
- Add Terraform CI workflow configuration
