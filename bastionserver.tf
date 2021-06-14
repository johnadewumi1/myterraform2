resource "oci_core_instance" "bastionserver" {

  compartment_id = var.compartment_id
  # availability_domain = data.template_file.ad_names.*.rendered[0]
  availability_domain = var.ADs[0]
  shape               = var.Shapes
  display_name        = "bastionserver"
  subnet_id           = oci_core_subnet.bastionsubnet.id
  fault_domain        = "FAULT-DOMAIN-2"
  source_details {
    source_type = "image"
    source_id   = var.image
  }
  metadata = {
    ssh_authorized_keys = file(var.public_key_oci)
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.bastionsubnet.id
    assign_public_ip = true
  }
}

data "oci_core_vnic_attachments" "bastionserver_attach" {
  compartment_id = var.compartment_id
  # availability_domain = data.template_file.ad_names.*.rendered[0]
  availability_domain = var.ADs[0]
  instance_id         = oci_core_instance.bastionserver.id
}

data "oci_core_vnic" "bastionserver_vnic" {
  vnic_id = data.oci_core_vnic_attachments.bastionserver_attach.vnic_attachments.0.vnic_id
}

output "webPublicIpbastion" {
  //  value = oci_core_instance.web.public_ip
  value = [data.oci_core_vnic.bastionserver_vnic.public_ip_address]
}