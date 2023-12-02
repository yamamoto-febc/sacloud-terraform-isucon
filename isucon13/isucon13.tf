terraform {
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "~> 2"
    }
  }
}

resource "sakuracloud_server" "isucon13" {
  name = "isucon13"
  zone = var.zone

  core   = 2
  memory = 4
  disks  = [sakuracloud_disk.isucon13.id]

  network_interface {
    upstream = "shared"
  }

  user_data = join("\n", [
    "#cloud-config",
    local.cloud-config,
    yamlencode({
      ssh_pwauth : false,
      ssh_authorized_keys : [
        file(var.public_key_path),
      ],
    }),
  ])
}

data "sakuracloud_archive" "ubuntu" {
  zone = var.zone

  filter {
    names = ["Ubuntu Server 22.04.2 LTS 64bit (cloudimg)"]
  }
}

resource "sakuracloud_disk" "isucon13" {
  name = "isucon13"
  zone = var.zone

  size              = 20
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

data "http" "cloud-config-source" {
  url = "https://raw.githubusercontent.com/matsuu/cloud-init-isucon/main/isucon13/isucon13.cfg"
}
locals {
  cloud-config = replace(data.http.cloud-config-source.response_body, "#cloud-config", "")
}

output "ip_address" {
  value = sakuracloud_server.isucon13.ip_address
}