terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.42.0"
    }
  }
}

# Configure the HuaweiCloud Provider
provider "huaweicloud" {
  region     = "ap-southeast-1"
  access_key = "YEYLAJAXECP8UV3A3OKL"
  secret_key = "FKF8zbBY8OMVqBJTRE96vKnPoW59FuHeU0y3UqaT"
}

variable "vpcpeering" {
  default = ["VPC1-VPC2", "VPC1-VPC3", "VPC2-VPC3"]
}
variable "vpcname" {
  default = ["9a4510e8-09f1-478c-b292-bd48239ce34c", "9a4510e8-09f1-478c-b292-bd48239ce34c", "a88d723e-0f1f-475c-b65f-6323e55691b2"]
}

variable "vpcpeername" {
  default = ["840483c7-d3ac-4957-9bec-48689ee80cf1", "32d89d1c-8d82-4be6-848d-b79a5348289e", "32d89d1c-8d82-4be6-848d-b79a5348289e"]
}


resource "huaweicloud_vpc_peering_connection" "peering" {
  count = 3
  name              = "${element(var.vpcpeering, count.index)}"
  vpc_id            = "${element(var.vpcname, count.index)}"
  peer_vpc_id       = "${element(var.vpcpeername, count.index)}"
}

