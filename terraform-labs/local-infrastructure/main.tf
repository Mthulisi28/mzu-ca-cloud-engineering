module "cloud_engineering_file" {
  source = "./modules/local-file"

  filename = "${path.module}/cloud-engineering-${var.environment}.txt"

  content = <<-EOT
    MZ-UCA Cloud Engineering

    Infrastructure as Code Lab

    Environment: ${var.environment}
    Tool: Terraform
    Purpose: Learning Infrastructure as Code and Cloud Governance
  EOT
}

module "cloud_governance_file" {
  source = "./modules/local-file"

  filename = "${path.module}/cloud-governance-${var.environment}.txt"

  content = <<-EOT
    MZ-UCA Cloud Engineering

    Cloud Governance Lab

    Environment: ${var.environment}
    Tool: Terraform
    Purpose: Learning reusable infrastructure and governance controls
  EOT
}
