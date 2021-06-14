resource "oci_core_route_table" "john_route_table" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.johnvcn.id

  display_name = "john_route_table"
  route_rules {
    network_entity_id = oci_core_internet_gateway.john_internet_gateways.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}