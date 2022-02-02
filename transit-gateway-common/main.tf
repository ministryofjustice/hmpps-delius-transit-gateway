#===================================
# Transit Gateway VPC Attachments
#===================================
resource "aws_ec2_transit_gateway_vpc_attachment" "delius_transit_gw_attachment" {
  subnet_ids         = ["${local.private_subnets}"]
  transit_gateway_id = "${local.transit_gateway_id}"
  vpc_id             = "${local.vpc_id}"

  dns_support  = "enable"
  ipv6_support = "disable"

  transit_gateway_default_route_table_association = "true"
  transit_gateway_default_route_table_propagation = "true"

  tags = "${merge(
    local.tags,
    map(
        "Name", "${local.transit_gateway_attachment_name}"
    )
  )}"
}
