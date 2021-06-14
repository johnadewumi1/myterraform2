resource "oci_core_security_list" "johnsecuritylist" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.johnvcn.id
  display_name   = "johnsecuritylist"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }
  ingress_security_rules {
    protocol = "6"
    source   = var.VCN-CIDR
  }
}