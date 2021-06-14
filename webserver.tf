resource "oci_core_instance" "johnserver" {

  compartment_id = var.compartment_id
  # availability_domain = data.template_file.ad_names.*.rendered[0]
  availability_domain = var.ADs[2]
  shape               = var.Shapes
  display_name        = "johnserver"
  subnet_id           = oci_core_subnet.privatesubnet.id
  fault_domain        = "FAULT-DOMAIN-1"
  source_details {
    source_type = "image"
    source_id   = var.image
  }
  metadata = {
    ssh_authorized_keys = file(var.public_key_oci)
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.privatesubnet.id
    assign_public_ip = false
  }
}

data "oci_core_vnic_attachments" "john_vnic_attach" {
  compartment_id = var.compartment_id
  # availability_domain = data.template_file.ad_names.*.rendered[0]
  availability_domain = var.ADs[2]
  instance_id         = oci_core_instance.johnserver.id
}

data "oci_core_vnic" "johnwebser_vnic" {
  vnic_id = data.oci_core_vnic_attachments.john_vnic_attach.vnic_attachments.0.vnic_id
}

output "webPrivateIp" {
  //  value = oci_core_instance.web.public_ip
  value = [data.oci_core_vnic.johnwebser_vnic.private_ip_address]
}