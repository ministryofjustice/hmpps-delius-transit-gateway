# Routes to I2N via transit gateway
# Routes to Private subnets

#================================================
# Routes to I2N AZ1 via transit gateways
#================================================
resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1-i2n-az1" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az1_cidr_range}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2-i2n-az1" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az1_cidr_range}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3-i2n-az1" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az1_cidr_range}"
}

#================================================
# Routes to I2N AZ2 via transit gateways
#================================================
resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1-i2n-az2" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az2_cidr_range}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2-i2n-az2" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az2_cidr_range}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3-i2n-az2" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az2_cidr_range}"
}

#================================================
# Routes to I2N AZ3 via transit gateways
#================================================
resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1-i2n-az3" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az3_cidr_range}"
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2-i2n-az3" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az3_cidr_range}"

}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3-i2n-az3" {
  count                  = "${local.env_create_i2n_routes}"
  route_table_id         = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id     = "${data.terraform_remote_state.common.pttp_transit_gateway_id}"
  destination_cidr_block = "${local.i2n_az3_cidr_range}"
}
