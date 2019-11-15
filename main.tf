# This Terraform script creates a virtual cloud network, provisions a compute
# instance, runs a script to configure server, and creates a custom image
# from the compute instance.

# Create VCN
module "vcn" {
  source = "./modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  availability_domain = "${var.availability_domain}"
  defined_tag_uptime = "${var.defined_tag_uptime}"
  defined_tag_team = "${var.defined_tag_team}"
  defined_tag_creator = "${var.defined_tag_creator}"
  defined_tag_closedate = "${var.defined_tag_closedate}"
}

# Create Compute Instance
module "compute" {
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  instance_name = "compute_image"
  subnet_ocid = "${module.vcn.subnet1_ocid}"
  instance_count = "${var.instance_count}"
  instance_shape = "${var.instance_shape}"
  image_ocid = "${var.image_ocid}"
  compute_display_name = "${var.compute_display_name}"
  availability_domain = "${var.availability_domain}"
  defined_tag_uptime = "${var.defined_tag_uptime}"
  defined_tag_team = "${var.defined_tag_team}"
  defined_tag_creator = "${var.defined_tag_creator}"
  defined_tag_closedate = "${var.defined_tag_closedate}"
}


