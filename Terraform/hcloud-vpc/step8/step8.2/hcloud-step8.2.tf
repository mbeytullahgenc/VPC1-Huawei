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
  default = ["a67571fd-2bdb-437c-8790-d5ecf7af9827","a67571fd-2bdb-437c-8790-d5ecf7af9827"]
}

variable "dest" {
  default = ["192.168.0.0/22","192.168.8.0/22"]
}

variable "next" {
  default = ["c78b20c1-e413-49db-978c-6747cdd2eb55","2249e5d3-f597-48f8-83cf-e50c4fda6588"]
}

data "huaweicloud_vpc_route_table" "rtb" {
  vpc_id = "a67571fd-2bdb-437c-8790-d5ecf7af9827"
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