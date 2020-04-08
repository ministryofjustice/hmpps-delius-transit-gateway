
# Shared data and constants

locals {

  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = "${var.aws_account_ids}"

  transit_gateway_id       = "tgw-05acb84d26b244813"
  cloudplatform_cidr_range = "172.20.0.0/16"

#  public_subnets = [
#    "${data.terraform_remote_state.vpc.vpc_public-subnet-az1}",
#    "${data.terraform_remote_state.vpc.vpc_public-subnet-az3}"
#    "${data.terraform_remote_state.vpc.vpc_public-subnet-az2}",
#  ]

  private_subnets = [
    "${data.terraform_remote_state.vpc.vpc_private-subnet-az1}",
    "${data.terraform_remote_state.vpc.vpc_private-subnet-az2}",
    "${data.terraform_remote_state.vpc.vpc_private-subnet-az3}"
  ]

#  db_subnets = [
#    "${data.terraform_remote_state.vpc.vpc_db-subnet-az1}",
#    "${data.terraform_remote_state.vpc.vpc_db-subnet-az2}",
#    "${data.terraform_remote_state.vpc.vpc_db-subnet-az3}"
#  ]

#  delius_subnets = [
#      "${local.private_subnets}",
#      "${local.public_subnets}",
#      "${local.db_subnets}"
#  ]

  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

}
