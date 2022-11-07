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
  default = ["1dbcf5e1-a81d-4a50-9351-7eba1aff9bab","1dbcf5e1-a81d-4a50-9351-7eba1aff9bab"]
}

variable "dest" {
  default = ["192.168.4.0/22","192.168.8.0/22"]
}

variable "next" {
  default = ["c78b20c1-e413-49db-978c-6747cdd2eb55","e9180e3c-8fe2-44c0-b392-07d2070f2453"]
}

data "huaweicloud_vpc_route_table" "rtb" {
  vpc_id = "1dbcf5e1-a81d-4a50-9351-7eba1aff9bab"
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