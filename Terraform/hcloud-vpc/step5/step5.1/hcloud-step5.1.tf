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

resource "huaweicloud_rds_database" "test" {
  instance_id   = "377470c376e1416797c842460fa42654in01"
  name          = "test1"
  character_set = "utf8"
  description   = "cloud test db"
}