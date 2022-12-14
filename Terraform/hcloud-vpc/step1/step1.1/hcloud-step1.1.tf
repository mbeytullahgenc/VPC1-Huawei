terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
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

variable "subnet_name" {
    default = ["vpc1_subnet1","vpc2_subnet1","vpc3_subnet1"]
  
}
variable "vpc_in" {
    default = ["1dbcf5e1-a81d-4a50-9351-7eba1aff9bab","a67571fd-2bdb-437c-8790-d5ecf7af9827","5ad31f18-f664-4f09-b61d-7c89c91a5cb6"]

}
variable "subnet_cidr" {
  default = ["192.168.0.0/24", "192.168.4.0/24", "192.168.8.0/24"]
}

variable "subnet_region" {
  default = ["ap-southeast-1", "ap-southeast-1", "ap-southeast-1"]
}

variable "subnet_gateway" {
  default = ["192.168.0.1", "192.168.4.1", "192.168.8.1"]
}

variable "ipv6_active" {
  default = ["false", "false", "false"]
}
resource "huaweicloud_vpc_subnet" "subnet" {
  count = 3
  name              = "${element(var.subnet_name, count.index)}"
  vpc_id            = "${element(var.vpc_in, count.index)}"
  cidr              = "${element(var.subnet_cidr, count.index)}"
  region            = "${element(var.subnet_region, count.index)}"
  gateway_ip        = "${element(var.subnet_gateway, count.index)}"
  ipv6_enable = "${element(var.ipv6_active, count.index)}"
}

