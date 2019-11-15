# Output variables from created vcn
output "subnet1_ocid" {
  value = "${oci_core_subnet.subnet_ad1.id}"
}
