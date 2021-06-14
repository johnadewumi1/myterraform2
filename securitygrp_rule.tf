resource "oci_core_network_security_group_security_rule" "web_security_Egress_rule" {
  #Required
  network_security_group_id = oci_core_network_security_group.web_security_group.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}
resource "oci_core_network_security_group_security_rule" "web_security_Ingress_rule" {
  for_each = toset(var.service_ports)
  #Required
  network_security_group_id = oci_core_network_security_group.web_security_group.id
  direction                 = "InGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type          = "CIDR_BLOCK"
  tcp_options {

    #Optional
    destination_port_range {
      #Required
      max = each.value
      min = each.value
    }
  }
}

resource "oci_core_network_security_group_security_rule" "ssh_security_Egress_rule" {
  #Required
  network_security_group_id = oci_core_network_security_group.ssh_security_group.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}
resource "oci_core_network_security_group_security_rule" "ssh_security_Ingress_rule" {
  for_each = toset(var.bastion_ports)
  #Required
  network_security_group_id = oci_core_network_security_group.ssh_security_group.id
  direction                 = "InGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type          = "CIDR_BLOCK"
  tcp_options {

    #Optional
    destination_port_range {
      #Required
      max = each.value
      min = each.value
    }
  }
}