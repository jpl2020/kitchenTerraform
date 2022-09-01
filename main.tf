terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.21.0"
    }
  }
}

resource "null_resource" "create_file" {
  provisioner "local-exec" {
    command = "echo 'this is my first test2' > foobar"
  }
}

resource "google_compute_instance" "test-instance" {
  name         = "apurv-instance-1"
  machine_type = "e2-medium"
  project = "searce-playground-v1"



    boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20220822"
    }
  }

  network_interface {
    network = "abhimanyu-shahi-vpc-terra"
    subnetwork = "secondary-subnet"

    access_config {
      // Ephemeral public IP
    }

  }
}
#  labels = {
#   owner = "apurv"
# }
# }
