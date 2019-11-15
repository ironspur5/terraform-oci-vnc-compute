# Output variables from created compute instance
output "instance_ocid" {
  value = "${oci_core_instance.compute_instance.id}"
}
output "public_ip" {
  value = "${oci_core_instance.compute_instance.public_ip}"
}
