# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"

  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  # Analytical Platform (Alpha)
  # CIDR Block: 192.168.0.0/16
  # Account ID: 593291632749
  analyticalplatform_alpha_cidr_range = "192.168.0.0/16"
  # Analytical Platform Data Engineering (Dev)
  # CIDR Block: 172.24.0.0/16
  # Account ID: 189157455002
  analyticalplatform_dev_cidr_range = "172.24.0.0/16"
  # Analytical Platform Data Engineering (Prod)
  # CIDR Block: 172.25.0.0/16
  # Account ID: 189157455002
  analyticalplatform_prod_cidr_range = "172.25.0.0/16"

  # Only create the routes to allow connectivity testing in these environments for Analytics ALPHA
  create_analytics_alpha_routes = {
    delius-pre-prod = "1"
  }

  env_create_analytics_alpha_routes = "${lookup(local.create_analytics_alpha_routes, "${local.environment_name}" , 0) }"

  # Only create the routes to allow connectivity testing in these environments for Analytics DEV
  create_analytics_dev_routes = {
    delius-core-sandpit = "1"
  }

  env_create_analytics_dev_routes = "${lookup(local.create_analytics_dev_routes, "${local.environment_name}" , 0) }"

  # Only create the routes to allow connectivity testing in these environments for Analytics PROD
  create_analytics_prod_routes = {
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }

  env_create_analytics_prod_routes = "${lookup(local.create_analytics_prod_routes, "${local.environment_name}" , 0) }"
  

  # Only create the security group ingress in these environments for Analytics ALPHA
  create_analytics_alpha_security_group_ingress = {
    delius-pre-prod = "1"
  }

  env_create_analytics_alpha_security_group_ingress = "${lookup(local.create_analytics_alpha_security_group_ingress, "${local.environment_name}" , 0) }"

  # Only create the security group ingress in these environments for Analytics DEV
  create_analytics_dev_security_group_ingress = {
    delius-core-sandpit = "1"
  }

  env_create_analytics_dev_security_group_ingress = "${lookup(local.create_analytics_dev_security_group_ingress, "${local.environment_name}" , 0) }"

  # Only create the security group ingress in these environments for Analytics PROD
  create_analytics_prod_security_group_ingress = {
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }

  env_create_analytics_prod_security_group_ingress = "${lookup(local.create_analytics_prod_security_group_ingress, "${local.environment_name}" , 0) }"
  


}
