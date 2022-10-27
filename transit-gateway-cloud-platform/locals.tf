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

  # I2N Landing Environments
  # Account ID: 778742069978
  i2n_az1_cidr_range = "10.110.96.0/24"
  i2n_az2_cidr_range = "10.110.97.0/24"
  i2n_az3_cidr_range = "10.110.98.0/24"


  # Only create the routes to allow connectivity testing in these environments for Cloudplatform
  create_cloudplatform_routes = {
    delius-core-dev     = "1"
    delius-test         = "1"
    delius-stage        = "1"
    delius-pre-prod     = "1"
    delius-prod         = "1"
  }
  env_create_cloudplatform_routes = "${lookup(local.create_cloudplatform_routes, "${local.environment_name}" , 0) }"

  create_i2n_routes = {
    delius-core-dev     = "1"
    delius-stage        = "1"
    delius-prod         = "1"
  }
  env_create_i2n_routes = "${lookup(local.create_i2n_routes, "${local.environment_name}" , 0) }"

}
