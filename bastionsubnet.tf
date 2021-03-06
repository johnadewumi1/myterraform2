resource "oci_core_subnet" "bastionsubnet" {
  cidr_block      = var.cidr_block[2]
  display_name    = "bastionsubnet"
  compartment_id  = var.compartment_id
  vcn_id          = oci_core_vcn.johnvcn.id
  dns_label       = "bastiondns"
  route_table_id  = oci_core_route_table.john_route_table.id
  dhcp_options_id = oci_core_dhcp_options.johnDhcpOptions.id
  # security_list_ids = [oci_core_security_list.sshsecuritylist.id]
}