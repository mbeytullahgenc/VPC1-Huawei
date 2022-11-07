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
  default = ["f0ea5225-912f-4c32-8697-ffe27571bdb3","f0ea5225-912f-4c32-8697-ffe27571bdb3"]
}

variable "dest" {
  default = ["192.168.4.0/22","192.168.8.0/22"]
}

variable "next" {
  default = ["bab15c76-40bb-4ceb-8811-2fd892df0f20","110bd4b9-705f-41c1-a8f9-32e3a69f8715"]
}

data "huaweicloud_vpc_route_table" "rtb" {
  vpc_id = "f0ea5225-912f-4c32-8697-ffe27571bdb3"
  name   = "rtb-vpc1"
}

resource "huaweicloud_vpc_route" "vpc_route" {
  count = 2
  vpc_id         = "${element(var.vpcid, count.index)}"
  route_table_id = data.huaweicloud_vpc_route_table.rtb.id
  destination    = "${element(var.dest, count.index)}"
  type           = "peering"
  nexthop        = "${element(var.next, count.index)}"
}