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

  # Only create the security group rule to allow connectivity testing in these environments for Analytics ALPHA
  create_analytics_alpha_security_group_rules = {
    delius-core-dev     = "1"
    delius-core-sandpit = "1"
  }

  env_create_analytics_alpha_security_group_rules = "${lookup(local.create_analytics_alpha_security_group_rules, "${local.environment_name}" , 0) }"

  # Only create the security group rule to allow connectivity testing in these environments for Analytics DEV
  create_analytics_dev_security_group_rules = {
    delius-core-dev     = "1"
    delius-core-sandpit = "1"
  }

  env_create_analytics_dev_security_group_rules = "${lookup(local.create_analytics_dev_security_group_rules, "${local.environment_name}" , 0) }"

  # Only create the security group rule to allow connectivity testing in these environments for Analytics PROD
  create_analytics_prod_security_group_rules = {
    delius-stage        = "1"
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }

  env_create_analytics_prod_security_group_rules = "${lookup(local.create_analytics_prod_security_group_rules, "${local.environment_name}" , 0) }"


}
