resource "aws_security_group_rule" "analytics_prod_test_ingress_delius_db_in_oracle_1521" {
  count             = "${local.env_create_analytics_prod_security_group_ingress}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "1521"
  to_port           = "1521"
  cidr_blocks       = ["${local.analyticalplatform_prod_cidr_range}"]
  security_group_id = "${data.terraform_remote_state.security_groups.sg_delius_core_db_in_from_mis_id}" # permanent sg in delius-network-terraform (decouples)
  description       = "Oracle 1521 from analytics prod platform"
}
