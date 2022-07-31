resource "sakuracloud_server" "private-isu-benchmarker" {
  name = "private-isu-benchmarker"
  zone = var.zone

  core   = 4
  memory = 8
  disks  = [sakuracloud_disk.private-isu-benchmarker.id]

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
    local.benchmarker-cloud-config,
    yamlencode({
      ssh_pwauth : false,
      ssh_authorized_keys : [
        file(var.public_key_path),
      ],
    }),
  ])
}

resource "sakuracloud_disk" "private-isu-benchmarker" {
  name = "private-isu-benchmarker"
  zone = var.zone

  size              = 20
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

data "http" "benchmarker-cloud-config-source" {
  url = "https://raw.githubusercontent.com/matsuu/cloud-init-isucon/main/private-isu/benchmarker.cfg"
}
locals {
  benchmarker-cloud-config = replace(data.http.benchmarker-cloud-config-source.body, "#cloud-config", "")
}

output "benchmarker_ip_address" {
  value = sakuracloud_server.private-isu-benchmarker.ip_address
}