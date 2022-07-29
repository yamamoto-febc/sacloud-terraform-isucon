# sacloud-terraform-isucon

https://github.com/matsuu/cloud-init-isucon とTerraformでさくらのクラウド上にISUCON過去問環境を構築します。

現在は以下に対応しています。
- ISUCON12予選

## 手順

- このリポジトリをクローン
- さくらのクラウドのAPIキーを環境変数に設定
- (必要に応じて)ゾーンと公開鍵ファイルのパスを修正
- `terraform apply`実施

```bash
# クローン
git clone https://github.com/yamamoto-febc/sacloud-terraform-isucon.git

# さくらのクラウドのAPIキーを環境変数に設定
export SAKURACLOUD_ACCESS_TOKEN="" # ここにアクセストークンを指定
export SAKURACLOUD_ACCESS_TOKEN="" # ここにアクセストークンシークレットを指定

# (必要に応じて)ゾーンの公開鍵ファイルのパスを指定

# 実行
terraform apply
```

### 変数のデフォルト値

デフォルトではゾーンと公開鍵ファイルのパスとして以下を利用します。

- ゾーン: `tk1b`(東京第2ゾーン)
- 公開鍵ファイルのパス: `~/.ssh/id_rsa.pub`

必要に応じてTerraformのvariableを設定してください。

設定例:
```bash
$ cat <<EOF > terraform.tfvars
zone = "is1b" # 石狩第2ゾーン
public_key_path="~/.ssh/id_ed25519.pub"
EOF
```

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [cloud-init-isucon/isucon12q/README](https://github.com/matsuu/cloud-init-isucon/blob/main/isucon12q/README.md)
* [ISUCON12 レギュレーション](https://isucon.net/archives/56671734.html)
* [ISUCON12 予選当日マニュアル](https://gist.github.com/mackee/4320c18919c8f6f1867849378a17e651)
* [ISUCON12 予選リポジトリ](https://github.com/isucon/isucon12-qualify)

## FAQ

- ログインしようとしたら`502`エラーが出る

ログイン時に`Failed to Login: AxiosError: Request failed with status code 502`というエラーが出る場合、
認証用の外部サービス `blackauth` が起動していない可能性があります。
この場合は手動でblackauthを起動してください。

```bash
sudo -i -u isucon
sudo systemctl start blackauth
```

## LICENSE

MIT