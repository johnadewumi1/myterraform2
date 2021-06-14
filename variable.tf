variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaapqytcu462c27feapv4bvf2ijszoqm7qmqjn4mx3koz3o5tjt5ska"
}

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaajznex5attydtrmrgudwayqu7kn4krasw2ct4h4pwz7nwbfxoyd4q"
}
variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaamrhp2f3m2evpmlme32kqavvgynxaz66oxfvrdephahsf72mwk6cq"
}
variable "fingerprint" {
  default = "80:3d:6d:28:1a:f7:82:94:0d:30:04:3f:e1:b9:3c:10"
}
variable "private_key_path" {
  default = "/home/opc/.oci/oci_api_key.pem"
}
variable "region" {
  default = "us-ashburn-1"
}
variable "private_key_oci" {
  default = "/home/opc/.ssh/id_rsa"
}
variable "public_key_oci" {
  default = "/home/opc/.ssh/id_rsa.pub"
}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "cidr_block" {
    default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "service_ports" {
  default = [80,443]
}

variable "bastion" {
    default = [22]
}

variable "ADs" {
  default = ["GrCh:US-ASHBURN-AD-1", "GrCh:US-ASHBURN-AD-2", "GrCh:US-ASHBURN-AD-3"]
}

variable "Shapes" {
  default = "VM.Standard2.1"
}

variable "image" {
  default = "ocid1.image.oc1.iad.aaaaaaaaw2wavtqrd3ynbrzabcnrs77pinccp55j2gqitjrrj2vf65sqj5kq"
}
variable "johnserver_user" {
  description = "Login user name for johnserver"
  default     = "opc"
}

variable "FlexShapeOCPUS" {
  default = 1
}
variable "FlexShapeMemory" {
  default = 1
}


variable "instance_os" {
  default = "Oracle Linux"
}

variable "linux_os_version" {
  default = "7.9"
}


variable "load_balancer_shape" {
  default = "100Mbps"
}


# variable "load_balancer_shape_details_maximum_bandwidth_in_mbps" {
#   default = "20"
# }

# variable "load_balancer_shape_details_minimum_bandwidth_in_mbps" {
#   default = "100"
# }

variable "listener_port" {
  default = 80
}

variable "listener_protocol" {
  default = "HTTP"
}

variable "backend_set_policy" {
  default = "ROUND_ROBIN"

}



# Dictionary Locals=
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}




//variable "Images" {
//  default = ["ocid1.image.oc1.us-sanjose-1.aaaaaaaasuer4imvqelnx65zx4m26wfof5chorsj5gxegwatjbdgtsdfcygq"]
//}

//variable "operating_system" {
//  default = "Oracle Linux"
//}
//variable "operating_system_version" {
//  default = "7.7"
//}
