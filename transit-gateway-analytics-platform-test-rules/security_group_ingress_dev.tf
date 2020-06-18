
resource "aws_security_group_rule" "analytics_dev_test_ingress_delius_db_in_icmp" {
  count             = "${local.env_create_analytics_dev_security_group_rules}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_dev_cidr_range}"]
  security_group_id = "${data.terraform_remote_state.security_groups.sg_delius_db_in_id}"
  description       = "Test ICMPv4 for connectivity from analytics dev platform"
}

// resource "aws_security_group_rule" "analytics_dev_test_ingress_weblogic_interface_instances_icmp" {
//   count             = "${local.env_create_analytics_dev_security_group_rules}"
//   type              = "ingress"
//   from_port         = -1
//   to_port           = -1
//   protocol          = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_dev_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from analytics dev platform"
// }

// resource "aws_security_group_rule" "analytics_dev_test_ingress_public_icmp" {
//   count             = "${local.env_create_analytics_dev_security_group_rules}"
//   type              = "ingress"
//   from_port = -1
//   to_port = -1
//   protocol = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_dev_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from analytics dev platform"
// }
