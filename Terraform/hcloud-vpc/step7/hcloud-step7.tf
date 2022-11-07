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
  default = ["1dbcf5e1-a81d-4a50-9351-7eba1aff9bab", "1dbcf5e1-a81d-4a50-9351-7eba1aff9bab", "a67571fd-2bdb-437c-8790-d5ecf7af9827"]
}

variable "vpcpeername" {
  default = ["a67571fd-2bdb-437c-8790-d5ecf7af9827", "5ad31f18-f664-4f09-b61d-7c89c91a5cb6", "5ad31f18-f664-4f09-b61d-7c89c91a5cb6"]
}


resource "huaweicloud_vpc_peering_connection" "peering" {
  count = 3
  name              = "${element(var.vpcpeering, count.index)}"
  vpc_id            = "${element(var.vpcname, count.index)}"
  peer_vpc_id       = "${element(var.vpcpeername, count.index)}"
}

