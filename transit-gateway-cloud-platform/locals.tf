# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"
  #transit_gateway_id = "${data.terraform_remote_state.common.transit_gateway_id}"
  #transit_gateway_attachment_name = "tgwa-${local.environment_name}-cloudplatform"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  cloudplatform_cidr_range        = "172.20.0.0/16"

}
