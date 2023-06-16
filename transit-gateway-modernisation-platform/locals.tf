# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = var.aws_account_ids
  vpc_id           = data.terraform_remote_state.vpc.vpc_id


  # Modernisation Platform
  # see https://github.com/ministryofjustice/modernisation-platform/blob/main/cidr-allocation.md
  mp_cidr_ranges_low  = ["10.26.0.0/16"]
  mp_cidr_ranges_high = ["10.27.0.0/16"]

  # Only create the routes to allow connectivity testing in these environments for modernisation platform
  create_modplatform_routes_low = {
    delius-core-dev = true
    delius-test     = true
  }
  env_create_modplatform_routes_low = lookup(local.create_modplatform_routes_low, "${local.environment_name}", false)

  create_modplatform_routes_high = {
    delius-stage    = true
    delius-pre-prod = true
    delius-prod     = true
  }
  env_create_modplatform_routes_high = lookup(local.create_modplatform_routes_high, "${local.environment_name}", false)
}
