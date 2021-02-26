
resource "google_compute_instance" "my_vm" {
    count = var.instance_count
    name = "${var.name}-${count.index+1}"
    machine_type = var.type_of_machine
    zone = var.zone
    boot_disk {
        initialize_params {
            image = var.boot_disk
        }
    }

metadata_startup_script = "sudo apt-get updates -y && sudo apt-get upgrade -y"

network_interface {
    subnetwork =  var.subnetwork
    network =  var.network
    access_config {}

    }
}
