
// resource "aws_security_group_rule" "cloudplatform_test_ingress_delius_db_in_icmp" {
//   count             = "${local.env_create_cloudplatform_security_group_rules}"
//   type              = "ingress"
//   from_port         = -1
//   to_port           = -1
//   protocol          = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.cloudplatform.cloudplatform_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_mis_out_to_delius_db_id}" # permanent sg in delius-network-terraform (decouples)
//   description       = "Test ICMPv4 for connectivity from cloudplatform platform"
// }

// resource "aws_security_group_rule" "cloudplatform_test_ingress_weblogic_interface_instances_icmp" {
//   count             = "${local.env_create_cloudplatform_security_group_rules}"
//   type              = "ingress"
//   from_port         = -1
//   to_port           = -1
//   protocol          = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.cloudplatform.cloudplatform_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from cloudplatform platform"
// }

// resource "aws_security_group_rule" "cloudplatform_test_ingress_public_icmp" {
//   count             = "${local.env_create_cloudplatform_security_group_rules}"
//   type              = "ingress"
//   from_port = -1
//   to_port = -1
//   protocol = "icmp"
//   cidr_blocks       = ["${data.terraform_remote_state.cloudplatform.cloudplatform_cidr_range}"]
//   security_group_id = "${data.terraform_remote_state.security_groups.sg_weblogic_interface_instances_id}"
//   description       = "Test ICMPv4 for connectivity from cloudplatform platform"
// }
