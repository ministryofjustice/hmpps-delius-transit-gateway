#================================================
# Routes to cloudplatform via transit gateway
# Routes to Public, Private & db subnets 
#===============================================


#######################
## Lower envs
#######################

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az1" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az2" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az3" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az1" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az2" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az3" {
  count                  = "${local.env_create_modplatform_routes_low}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

#######################
## Higher envs
#######################

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az1" {
  count                  = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az2" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az3" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_public-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az1" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az2" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az3" {
  count               = "${local.env_create_modplatform_routes_high}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_db-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${each.value}"
}
