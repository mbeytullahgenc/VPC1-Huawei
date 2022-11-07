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

variable "ecs_name" {
    default = ["ecs1","ecs2"] 
}

variable "network_id" {
    default = ["fc4d6787-9fbf-49fb-a6be-aa59d06e7725","2f3479f5-6341-4d98-ab81-58fc35543e55"]
  
}

#Create ECS
resource "huaweicloud_compute_instance" "ecs" {
  count = 2
  name              = "${element(var.ecs_name, count.index)}"
  image_id           = "67159f00-89c1-44eb-b810-c90478376cb4"
  system_disk_type = "SAS"
  flavor_id          = "s3.small.1"
  availability_zone  = "ap-southeast-1b"
  admin_pass = "Huawei*2022"
  region = "ap-southeast-1"

    network {
        access_network = true
        uuid = "${element(var.network_id, count.index)}"
  }
}