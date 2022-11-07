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

# Create a VPC
resource "huaweicloud_vpc" "vpc1" {
  name = "vpc1"
  region = "ap-southeast-1"
  cidr = "192.168.0.0/22"
   tags = {
    key = "vpc1"
  }
}

resource "huaweicloud_vpc" "vpc2" {
  name = "vpc2"
  region = "ap-southeast-1"
  cidr = "192.168.4.0/22"
    tags = {
    key = "vpc2"
  }
}

resource "huaweicloud_vpc" "vpc3" {
  name = "vpc3"
  region = "ap-southeast-1"
  cidr = "192.168.8.0/22"
    tags = {
    key = "vpc3"
  }
}