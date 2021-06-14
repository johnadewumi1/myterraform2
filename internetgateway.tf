resource "oci_core_internet_gateway" "john_internet_gateways" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name = "john_internet_gateways"
  vcn_id       = oci_core_vcn.johnvcn.id
}