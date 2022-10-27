# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"
  #transit_gateway_id = "${data.terraform_remote_state.common.transit_gateway_id}"
  #transit_gateway_attachment_name = "tgwa-${local.environment_name}-cloudplatform"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  cloudplatform_cidr_range        = "172.20.0.0/16"

  # Only create the security group rule to allow connectivity testing in these environments for Cloudplatform
  create_cloudplatform_security_group_rules = {
    delius-core-dev     = "1"
    delius-test         = "1"
    delius-stage        = "1"
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }

  env_create_cloudplatform_security_group_rules = "${lookup(local.create_cloudplatform_security_group_rules, "${local.environment_name}" , 0) }"
  
}
