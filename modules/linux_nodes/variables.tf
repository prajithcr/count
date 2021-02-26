variable "type_of_machine" {
  default = "e2-micro"
}

variable "boot_disk"{
  default = "ubuntu-2004-focal-v20210211"
}


variable "name"{
  default = "prajith-terrafarm-vm-test"
}

variable "zone" {
  default = "us-central1-a"

}

variable metadata_startup_scrpt {
  default = "apt-get update -y && apt-get upgrade -y"
}

variable "subnetwork" {
  default = "prajith-subnet"
}


variable "network" {
  default = "prajith-vpc"
}

variable "instance_count" {
  default = "1"
}
