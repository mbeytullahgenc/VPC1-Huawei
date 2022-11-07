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

variable "vpcid" {
  default = ["a88d723e-0f1f-475c-b65f-6323e55691b2","a88d723e-0f1f-475c-b65f-6323e55691b2"]
}

variable "dest" {
  default = ["192.168.0.0/22","192.168.8.0/22"]
}

variable "next" {
  default = ["bab15c76-40bb-4ceb-8811-2fd892df0f20","9acb7c97-f61f-42cc-91f5-8a7546221f22"]
}

data "huaweicloud_vpc_route_table" "rtb" {
  vpc_id = "a88d723e-0f1f-475c-b65f-6323e55691b2"
  name   = "rtb-vpc2"
}

resource "huaweicloud_vpc_route" "vpc_route" {
  count = 2
  vpc_id         = "${element(var.vpcid, count.index)}"
  route_table_id = data.huaweicloud_vpc_route_table.rtb.id
  destination    = "${element(var.dest, count.index)}"
  type           = "peering"
  nexthop        = "${element(var.next, count.index)}"
}