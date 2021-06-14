resource "oci_core_subnet" "privatesubnet" {
  cidr_block        = var.cidr_block[0]
  display_name      = "privatesubnet"
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.johnvcn.id
  dns_label         = "privatendns"
  route_table_id    = oci_core_route_table.john_route_tableviaNAT.id
  dhcp_options_id   = oci_core_dhcp_options.johnDhcpOptions.id
  security_list_ids = [oci_core_security_list.johnsecuritylist.id, oci_core_security_list.sshsecuritylist.id]
}