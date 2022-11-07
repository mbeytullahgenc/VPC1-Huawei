terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.26.0"
    }
  }
}

# Configure the HuaweiCloud Provider
provider "huaweicloud" {
  region     = "ap-southeast-1"
  access_key = "YEYLAJAXECP8UV3A3OKL"
  secret_key = "FKF8zbBY8OMVqBJTRE96vKnPoW59FuHeU0y3UqaT"
}

#Configure Security Group
resource "huaweicloud_networking_secgroup" "secgroup" {
  name        = "secgroup-basic"
  description = "basic security group"
  region = "ap-southeast-1"
}

# allow all
resource "huaweicloud_networking_secgroup_rule" "allow_all" {
  direction         = "ingress"
  region = "ap-southeast-1"
  ethertype         = "IPv4"
  protocol          = "All"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
}