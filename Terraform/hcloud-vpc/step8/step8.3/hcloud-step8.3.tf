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
  default = ["92e0e767-b908-4005-9a4a-248993a402cc","92e0e767-b908-4005-9a4a-248993a402cc"]
}

variable "dest" {
  default = ["192.168.0.0/22","192.168.4.0/22"]
}

variable "next" {
  default = ["110bd4b9-705f-41c1-a8f9-32e3a69f8715","9acb7c97-f61f-42cc-91f5-8a7546221f22"]
}

data "huaweicloud_vpc_route_table" "rtb" {
  vpc_id = "92e0e767-b908-4005-9a4a-248993a402cc"
  name   = "rtb-vpc3"
}

resource "huaweicloud_vpc_route" "vpc_route" {
  count = 2
  vpc_id         = "${element(var.vpcid, count.index)}"
  route_table_id = data.huaweicloud_vpc_route_table.rtb.id
  destination    = "${element(var.dest, count.index)}"
  type           = "peering"
  nexthop        = "${element(var.next, count.index)}"
}