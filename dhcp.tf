
resource "oci_core_dhcp_options" "johnDhcpOptions" {
  #Required
  compartment_id = var.compartment_id
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = ["jahmaiadewumi.com"]
  }

  vcn_id = oci_core_vcn.johnvcn.id

  #Optional
  display_name = "johnDhcpOptions"
}




