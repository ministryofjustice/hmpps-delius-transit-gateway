# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"

  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  # Analytical Platform Data Engineering (Dev)
  # CIDR Block: 172.24.0.0/16
  # Account ID: 189157455002
  analyticalplatform_dev_cidr_range = "172.24.0.0/16"
  # Analytical Platform Data Engineering (Prod)
  # CIDR Block: 172.25.0.0/16
  # Account ID: 189157455002
  analyticalplatform_prod_cidr_range = "172.25.0.0/16"
  
}
