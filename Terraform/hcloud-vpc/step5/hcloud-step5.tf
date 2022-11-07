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

resource "huaweicloud_networking_secgroup" "secgroup" {
name = "secgroup-basic"
}

resource "huaweicloud_rds_instance" "instance" {
  name              = "rds-mysql1"
  flavor            = "rds.mysql.n1.large.2"
  vpc_id            = "5ad31f18-f664-4f09-b61d-7c89c91a5cb6"
  subnet_id         = "81a91e91-61ac-4bdc-9d6f-e9927b8d6f6a"
  security_group_id = "ee8586ad-4da4-44e9-887f-7ff8e1e693ea"
  availability_zone = ["ap-southeast-1b"]

  db {
    type     = "MySQL"
    version  = "8.0"
    password = "Huawei*2022"
  }

  volume {
    type = "CLOUDSSD"
    size = 40
  }

}