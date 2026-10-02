terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

module "cloud_engineering_file" {
  source = "./modules/local-file"

  filename = "${path.module}/cloud-engineering.txt"

  content = <<-EOT
    MZ-UCA Cloud Engineering

    Infrastructure as Code Lab

    Environment: Local Linux
    Tool: Terraform
    Purpose: Learning Infrastructure as Code and Cloud Governance
  EOT
}

module "cloud_governance_file" {
  source = "./modules/local-file"

  filename = "${path.module}/cloud-governance.txt"

  content = <<-EOT
    MZ-UCA Cloud Engineering

    Cloud Governance Lab

    Environment: Local Linux
    Tool: Terraform
    Purpose: Learning reusable infrastructure and governance controls
  EOT
}
