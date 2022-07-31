terraform {
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "~> 2"
    }
  }
}

resource "sakuracloud_server" "kayac-isucon-2022" {
  name = "kayac-isucon-2022"
  zone = var.zone

  core   = 2
  memory = 4
  disks  = [sakuracloud_disk.kayac-isucon-2022.id]

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
    names = ["Ubuntu Server 20.04 LTS 64bit (cloudimg)"]
  }
}

resource "sakuracloud_disk" "kayac-isucon-2022" {
  name = "kayac-isucon-2022"
  zone = var.zone

  size              = 20
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

data "http" "cloud-config-source" {
  url = "https://raw.githubusercontent.com/matsuu/cloud-init-kayac-isucon-2022/main/kayac-isucon-2022.cfg"
}
locals {
  cloud-config = replace(data.http.cloud-config-source.body, "#cloud-config", "")
}

output "ip_address" {
  value = sakuracloud_server.kayac-isucon-2022.ip_address
}