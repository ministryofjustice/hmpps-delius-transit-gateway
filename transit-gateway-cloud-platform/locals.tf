# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"
  #transit_gateway_id = "${data.terraform_remote_state.common.transit_gateway_id}"
  #transit_gateway_attachment_name = "tgwa-${local.environment_name}-cloudplatform"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"


  # CloudPlatform (All k8s Environments)
  # CIDR Block: 172.20.0.0/16
  # Account ID: 183554782509
  cloudplatform_cidr_range = "172.20.0.0/16"

  # Only create the routes to allow connectivity testing in these environments for Cloudplatform
  create_cloudplatform_routes = {
    delius-core-dev     = "1"
    delius-core-sandpit = "1"
    delius-stage        = "1"
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }

  env_create_cloudplatform_routes = "${lookup(local.create_cloudplatform_routes, "${local.environment_name}" , 0) }"

}
