resource "oci_core_nat_gateway" "john_NAT_gateways" {
    compartment_id = var.compartment_id
    display_name = john_NAT_gateways
    vcn_id = oci_core_vcn.johnvcn.id
}