#====================================================
# remote state for common (transit gw id)
#====================================================

data "terraform_remote_state" "common" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_bucket_name}"
    key    = "delius-transit-gateway-attachments/transit-gateway-common/terraform.tfstate"
    region = "${var.region}"
  }
}

data "terraform_remote_state" "analytics" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_bucket_name}"
    key    = "delius-transit-gateway-attachments/transit-gateway-analytics-platform/terraform.tfstate"
    region = "${var.region}"
  }
}

#====================================================
# remote state for target env (route tables)
#====================================================

# Load in VPC state data for subnet placement
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_bucket_name}"
    key    = "vpc/terraform.tfstate"
    region = "${var.region}"
  }
}

data "terraform_remote_state" "security_groups" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_bucket_name}"
    key    = "security-groups/terraform.tfstate"
    region = "${var.region}"
  }
}


# Get current context for things like account id
data "aws_caller_identity" "current" {}
