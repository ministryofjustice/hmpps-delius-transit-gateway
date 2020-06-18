
resource "aws_security_group_rule" "analytics_alpha_test_ingress_delius_db_in_icmp" {
  count             = "${local.env_create_analytics_alpha_security_group_rules}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_alpha_cidr_range}"]
  security_group_id = "${data.terraform_remote_state.security_groups.sg_mis_out_to_delius_db_id}" # permanent sg in delius-network-terraform (decouples)
  description       = "Test ICMPv4 for connectivity from analytics alpha platform"
}

// resource "aws_security_group_rule" "analytics_alpha_test_ingress_weblogic_interface_instances_icmp" {
//   count             = "${local.env_create_analytics_alpha_security_group_rules}"
//   type              = "ingress"
//   from_port         = -1
//   to_port           = -1
//   protocol          = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_alpha_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from analytics alpha platform"
// }

// resource "aws_security_group_rule" "analytics_alpha_test_ingress_public_icmp" {
//   count             = "${local.env_create_analytics_alpha_security_group_rules}"
//   type              = "ingress"
//   from_port = -1
//   to_port = -1
//   protocol = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_alpha_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from analytics alpha platform"
// }
