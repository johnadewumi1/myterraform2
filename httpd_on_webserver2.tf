resource "null_resource" "web2HTTPD" {
  depends_on = [oci_core_instance.johnserver2]
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.johnwebser2_vnic.private_ip_address
      private_key = file(var.private_key_oci)
      script_path = "/home/opc/ssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo touch /var/www/html/index.html",
      "sudo /bin/su -c \"echo 'welcome to John server2! Your home...' > /var/www/html/index.html\"",
      "sudo service firewalld stop",
      "sudo service httpd start",
    ]
  }
}
