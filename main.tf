data "terraform_remote_state" "network_details" {
    backend = "gcs"
    config = {
        bucket = "student-prajith-bucket"
        prefix = "prajith-10-network-statefile"
    }
}

resource "google_compute_instance" "my_vm" {
    name = "prajith-terraform-vm-test"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "ubuntu-2004-focal-v20210211"
        }
    }

metadata_startup_script = "sudo apt-get updates -y && sudo apt-get upgrade -y"

network_interface {
    subnetwork = data.terraform_remote_state.network_details.outputs.prajith-subnet
    network = data.terraform_remote_state.network_details.outputs.prajith-vpc
    access_config {}

    }
}
