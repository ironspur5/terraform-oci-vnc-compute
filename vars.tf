# Variables Exported from env.sh
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "ssh_public_key" {}
variable "instance_shape" {}
variable "image_ocid" {}
variable "ssh_authorized_private_key" {}
variable "defined_tag_uptime" {}
variable "defined_tag_team" {}
variable "defined_tag_creator" {}
variable "defined_tag_closedate" {}
# Uses Default Value
variable "instance_count" {
  default="1"
}
variable "compute_display_name" {
  default="Compute_Template"
}
variable "availability_domain" {
  default="1"
}
