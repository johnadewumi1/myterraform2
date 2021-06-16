resource "null_resource" "webHTTPD" {
  depends_on = [oci_core_instance.johnserver]
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.johnwebser_vnic.private_ip_address
      private_key = file(var.private_key_oci)
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo touch /var/www/html/index.html",
      "sudo /bin/su -c \"echo 'welcome to John server1! Your home...' > /var/www/html/index.html\"",
      "sudo service firewalld stop",
      "sudo service httpd start",
    ]
  }
}
