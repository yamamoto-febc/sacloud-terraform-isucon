resource "sakuracloud_server" "private-isu-app" {
  name = "private-isu-app"
  zone = var.zone

  core   = 2
  memory = 4
  disks  = [sakuracloud_disk.private-isu-app.id]

  network_interface {
    upstream = "shared"
  }

  # Note:
  #   仮想スイッチに接続する場合はここコメントアウトを解除してください
  #   (terraform applyした後でOS上でnetplanなどによるIPアドレスの設定が必要です)
  ###
  #network_interface {
  #  upstream = sakuracloud_switch.private-iswitch.id
  #}

  user_data = join("\n", [
    "#cloud-config",
    local.app-cloud-config,
    yamlencode({
      ssh_pwauth : false,
      ssh_authorized_keys : [
        file(var.public_key_path),
      ],
    }),
  ])
}

resource "sakuracloud_disk" "private-isu-app" {
  name = "private-isu-app"
  zone = var.zone

  size              = 20
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

data "http" "app-cloud-config-source" {
  url = "https://raw.githubusercontent.com/matsuu/cloud-init-isucon/main/private-isu/app.cfg"
}
locals {
  app-cloud-config = replace(data.http.app-cloud-config-source.body, "#cloud-config", "")
}

output "app_ip_address" {
  value = sakuracloud_server.private-isu-app.ip_address
}