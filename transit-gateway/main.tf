
#===================================
# Resource Access Manager
#===================================
#resource "aws_ram_principal_association" "cloudplatform" {
#  #provider = "aws.first"
#
#  principal          = "${data.aws_caller_identity.second.account_id}"
#  resource_share_arn = "${data.aws_ram_resource_share.example.id}"
#}

#===================================
# Transit Gateway
#===================================
# this is created on the CloudPlatform Account side

#===================================
# Transit Gateway VPC Attachments
#===================================
resource "aws_ec2_transit_gateway_vpc_attachment" "delius_transit_gw_attachment" {

  #depends_on = ["aws_ram_principal_association.example"]

  subnet_ids         = ["${local.private_subnets}"]
  transit_gateway_id = "${local.transit_gateway_id}"
  vpc_id             = "${local.vpc_id}"

  dns_support        = "enable"
  ipv6_support       = "disable"

  transit_gateway_default_route_table_association = "true"
  transit_gateway_default_route_table_propagation = "true"

  tags = "${var.tags}"
}

#================================================
# Routes to cloudplatform via transit gateway
# Routes to Public, Private & db subnets 
#================================================
resource "aws_route" "transit_gateway_route_vpc_public-routetable-az1" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_public-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az2" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_public-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_public-routetable-az3" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az1" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az2" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_private-routetable-az3" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_private-routetable-az3}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az1" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az1}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az2" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az2}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}

resource "aws_route" "transit_gateway_route_vpc_db-routetable-az3" {
  route_table_id            = "${data.terraform_remote_state.vpc.vpc_db-routetable-az3}"
  transit_gateway_id        = "${local.transit_gateway_id}"
  destination_cidr_block    = "${local.cloudplatform_cidr_range}"
  depends_on                = ["aws_ec2_transit_gateway_vpc_attachment.delius_transit_gw_attachment"]
}
