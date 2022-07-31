# Note:
#   仮想スイッチを作成する場合はここをコメントアウトを解除してください
#   また各サーバ側のコード(.tf)にもスイッチに接続するためのコードが必要です
###
#resource "sakuracloud_switch" "private-iswitch" {
#  name = "private-isu"
#  zone = var.zone
#}