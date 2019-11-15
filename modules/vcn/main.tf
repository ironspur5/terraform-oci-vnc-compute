# Create VCN
resource "oci_core_virtual_network" "vcn" {
  cidr_block = "10.0.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name = "vcn"
  defined_tags = {
    "RootNamespace.Uptime"= "${var.defined_tag_uptime}",
    "RootNamespace.Team"="${var.defined_tag_team}",
    "RootNamespace.Creator"="${var.defined_tag_creator}",
    "RootNamespace.CloseDate"="${var.defined_tag_closedate}"
  }
}

# Create internet gateway to allow public internet traffic
resource "oci_core_internet_gateway" "ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "ig"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
}

# Create route table to connect vcn and internet gateway
resource "oci_core_route_table" "rt" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
  display_name = "rt"
  defined_tags = {
    "RootNamespace.Uptime"= "${var.defined_tag_uptime}",
    "RootNamespace.Team"="${var.defined_tag_team}",
    "RootNamespace.Creator"="${var.defined_tag_creator}",
    "RootNamespace.CloseDate"="${var.defined_tag_closedate}"
  }
  route_rules {
    cidr_block = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.ig.id}"
  }
}

# Create security list to allow internet access from compute and ssh access

resource "oci_core_security_list" "sl" {
  display_name   = "sl"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  defined_tags = {
    "RootNamespace.Uptime"= "${var.defined_tag_uptime}",
    "RootNamespace.Team"="${var.defined_tag_team}",
    "RootNamespace.Creator"="${var.defined_tag_creator}",
    "RootNamespace.CloseDate"="${var.defined_tag_closedate}"
  }
  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
        min = 22
        max = 22
      }
  }
}

# Create subnet in vcn
resource "oci_core_subnet" "subnet_ad1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1],"name")}"
  cidr_block = "10.0.1.0/24"
  defined_tags = {
    "RootNamespace.Uptime"= "${var.defined_tag_uptime}",
    "RootNamespace.Team"="${var.defined_tag_team}",
    "RootNamespace.Creator"="${var.defined_tag_creator}",
    "RootNamespace.CloseDate"="${var.defined_tag_closedate}"
  }
  display_name = "subnet_ad1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.vcn.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
  route_table_id = "${oci_core_route_table.rt.id}"
  security_list_ids = ["${oci_core_security_list.sl.id}"]
}
