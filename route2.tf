resource "oci_core_route_table" "john_route_tableviaNAT" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.johnvcn.id

  display_name = "john_route_tableviaNAT"
  route_rules {
    network_entity_id = oci_core_nat_gateway.john_NAT_gateways.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}