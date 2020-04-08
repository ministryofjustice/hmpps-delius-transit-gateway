variable "region" {
  description = "The AWS region."
  default = "eu-west-2"
}

variable "remote_state_bucket_name" {
  default = "tf-eu-west-2-hmpps-delius-core-dev-remote-state"
}

variable "tags" {
  description = "Standard tags map"
  type        = "map"
}