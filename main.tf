//Netskope Resources
//
//Create Publisher in Netskope
resource "netskope_publishers" "Publisher" {
  name = var.publisher_name
}

//Create Cloud-Init Config with Publisher Token
data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    content      = templatefile("cloud-init.tftpl", { token = netskope_publishers.Publisher.token })
  }
}

# Create a netskope publisher
resource "google_compute_instance" "NPAPublisher" {
  name         = var.publisher_name
  project      = var.project
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["ssh"]

  metadata = {
    user-data = "${data.template_cloudinit_config.config.rendered}"
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = var.network_interface

    access_config {
      # Ephemeral External IP address
    }
  }
}

