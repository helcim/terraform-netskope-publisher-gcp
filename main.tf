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
    content      = templatefile("${path.module}/cloud-init.tftpl", { token = netskope_publishers.Publisher.token })
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
    user-data = "${data.template_cloudinit_config.config.rendered}",
    block-project-ssh-keys = "${var.block_project_ssh_keys}",
    ssh-keys  = "${var.ssh_user}:${var.public_key}"
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }

  }

  network_interface {
    network = var.network_interface

    dynamic "access_config" {
       for_each = var.associate_public_ip_address == false ? [] : [1]
       content {
          // access_config
       }
    }
  }
}


