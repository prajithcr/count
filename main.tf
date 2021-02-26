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
    metadata = {
     ssh-keys ="elon:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnYufzlAf6hp2fe0IOk16Uqpypox/ra/IKCwTIeiacUQGDjTrLiofZXNQ8htdUYIJD86ZBc4xJ3VyI8uHe+2ASMS5R7r63D+4E4mu4jNPRUGtgC95V10Td2FDOfzwLtFJzF3iGwwyNtcv3aQ1W6fq8U0GOCT0xZSNofr2pzSBQADl0snxEkcFonqBnWj625IuwrkUAnvBZtQEil2wUEHG6Ttb5d8NBv4SFzxZ5IZDTnEtijErOsU2TU7ncQi0rGZKZA3tzRiU1KDVdnMwrCGc8N8cSLVzV1Mt0dESJtTpB9hvWIXZ/fBm4TFXd1gZxphKtmkfOFjFl5iw77bTC0/2vbc/cVlkT2OaNaINNbKVlTLGk+tY0YQEfTa9Y9ad+hJgOXx31oyw2slKQkE0EDUy/Y9WXjLLpwAUigzETx8z0enhfSV5KwcySilJ+b/Rrd802He4PtYOVV7Jg/UcQFqiDlRw+xIzVRdAEmJ60E1pkCHEhxGyhZm0wbCB69k9gtxE= elon@prajith-test"
  }
}
