# Shared data and constants

locals {
  environment_name = "${var.project_name}-${var.environment_type}"
  account_ids      = var.aws_account_ids
  vpc_id           = data.terraform_remote_state.vpc.vpc_id


  # Modernisation Platform
  mp_cidr_ranges = [""]

  # Only create the routes to allow connectivity testing in these environments for modernisation platform
  create_modplatform_routes = {
    delius-core-dev = true
    delius-test     = true
    delius-stage    = true
    delius-pre-prod = true
    delius-prod     = true
  }
  env_create_modplatform_routes = lookup(local.create_modplatform_routes, "${local.environment_name}", false)
}
