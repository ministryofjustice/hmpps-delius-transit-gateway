#================================================
# Routes to Analytical Platform Data Engineering (Dev)
# Routes to Public, Private & db subnets 
#================================================
// resource "aws_route" "transit_gateway_route_vpc_public-routetable-az1-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az1}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
//   count                  = "${local.env_env_create_analytics_dev_routes}"
// }

// resource "aws_route" "transit_gateway_route_vpc_public-routetable-az2-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az2}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_public-routetable-az3-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az3}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_db-routetable-az1-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

// resource "aws_route" "transit_gateway_route_vpc_db-routetable-az2-apde-dev" {
//   count                  = "${local.env_create_analytics_dev_routes}"
//   route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az2}"
//   transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
//   destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
// }

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az3-apde-dev" {
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.analyticalplatform_dev_cidr_range}"
  count                  = "${local.env_create_analytics_dev_routes}"
}
