resource "oci_core_vcn" "johnvcn" {
  cidr_block     = var.VCN-CIDR
  compartment_id = var.compartment_id
  dns_label      = "MyinternalVCN"
  display_name   = "MyinternalVCN"
}
