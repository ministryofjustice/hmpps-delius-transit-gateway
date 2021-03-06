
resource "aws_security_group_rule" "analytics_dev_test_ingress_delius_db_in_icmp" {
  count             = "${local.env_create_analytics_dev_security_group_rules}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["${data.terraform_remote_state.analytics.analyticalplatform_dev_cidr_range}"]
  security_group_id = "${data.terraform_remote_state.security_groups.sg_delius_core_db_in_from_mis_id}" # permanent sg in delius-network-terraform (decouples)
  description       = "Test ICMPv4 for connectivity from analytics dev platform"
}
