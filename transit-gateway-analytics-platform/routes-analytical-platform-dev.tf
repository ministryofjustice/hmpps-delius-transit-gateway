#================================================
# Routes to Analytical Platform Data Engineering (Dev)
# Routes to Public, Private & db subnets 
#================================================
resource "aws_route" "transit_gateway_route_vpc_public-routetable-az1-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_public-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az2-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_public-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az3-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az1-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az2-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az3-apde-dev" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az3}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.analyticalplatform_dev_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}
