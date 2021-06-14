data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_id
}
data "template_file" "ad_names" {
  count    = length(data.oci_identity_availability_domains.ad.availability_domains)
  template = lookup(data.oci_identity_availability_domains.ad.availability_domains[count.index], "name")
}


//data "oci_core_images" "tf_images" {
//  compartment_id           = var.compartment_id
//  operating_system         = var.operating_system
//  operating_system_version = var.operating_system_version
//  shape                    = var.Shapes
//}

data "oci_core_images" "oraclelinux-7-7" {
  compartment_id           = var.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = "7.7"
  filter {
    name   = "display_name"
    values = ["^([a-zA-z]+)-([a-zA-z]+)-([\\.0-9]+)-([\\.0-9-]+)$"]
    regex  = true
  }
}

data "oci_core_shapes" "tf_shapes" {
  compartment_id = var.compartment_id
}
