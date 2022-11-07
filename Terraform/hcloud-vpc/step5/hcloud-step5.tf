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
  vpc_id            = "32d89d1c-8d82-4be6-848d-b79a5348289e"
  subnet_id         = "19e6d6b4-e334-490a-bce9-a9d257cc0b20"
  security_group_id = "1c025496-b03e-402d-9ff0-04218190f414"
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