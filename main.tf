data "terraform_remote_state" "network_details" {
    backend = "gcs"
    config = {
        bucket = "student-prajith-bucket"
        prefix = "prajith-10-network-statefile"
    }
}


module "my-server" {
    source = "./modules/linux_nodes"
    boot_disk = "ubuntu-2004-focal-v20210211"
    type_of_machine = var.type_of_machine
    name = "prajith-terraform-vm-test"
    zone = "us-central1-a"
    instance_count = var.instance_count
    subnetwork = data.terraform_remote_state.network_details.outputs.prajith-subnet
    network = data.terraform_remote_state.network_details.outputs.prajith-vpc
  }

