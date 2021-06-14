resource "oci_core_network_security_group" "web_security_group" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.johnvcn.id
  display_name   = "web_security_group"
}

resource "oci_core_network_security_group" "ssh_security_group" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.johnvcn.id
  display_name   = "ssh_security_group"
}