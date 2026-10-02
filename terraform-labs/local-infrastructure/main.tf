terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "cloud_engineering" {
  filename = "${path.module}/cloud-engineering.txt"

  content = <<-EOT
    MZ-UCA Cloud Engineering

    Infrastructure as Code Lab

    Environment: Local Linux
    Tool: Terraform
    Purpose: Learning Infrastructure as Code and Cloud Governance
  EOT
}
