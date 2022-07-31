# sacloud-terraform-isucon

https://github.com/matsuu/cloud-init-isucon とTerraformでさくらのクラウド上にISUCON過去問環境を構築します。

現在は以下に対応しています。

### 公式

- [ISUCON10予選](./isucon10q)
- [ISUCON11予選](./isucon11q)
- [ISUCON12予選](./isucon12q)

### 非公式

- [Pixiv社内ISUCON2016(private-isu)](./private-isu)
- (未対応)ISUCON11事前講習
- (未対応)Kayac社内ISUCON2022
- (未対応)NRI-ISUCON2022

## 構築手順

- このリポジトリをクローン & 構築したい環境のディレクトリへ移動
- さくらのクラウドのAPIキーを環境変数に設定
- (必要に応じて)ゾーンと公開鍵ファイルのパスを修正
- `terraform apply`実施

```bash
# クローン
git clone https://github.com/yamamoto-febc/sacloud-terraform-isucon.git && cd sacloud-terraform-isucon

# 構築したい環境のディレクトリへ移動(ここでは例としてisucon12予選)
cd isucon12q

# さくらのクラウドのAPIキーを環境変数に設定
export SAKURACLOUD_ACCESS_TOKEN="" # ここにアクセストークンを指定
export SAKURACLOUD_ACCESS_TOKEN_SECRET="" # ここにアクセストークンシークレットを指定

# (必要に応じて)ゾーンの公開鍵ファイルのパスを指定

# 実行
terraform init && terraform apply
```

### 変数の設定

各環境とも以下2つの変数を利用します。

- ゾーン(`zone`): デフォルト値は`tk1b`(東京第2ゾーン)
- 公開鍵ファイルのパス(`public_key_path`): デフォルト値は`~/.ssh/id_rsa.pub`

必要に応じてTerraformのvariableを設定してください。

設定例:
```bash
$ cat <<EOF > terraform.tfvars
zone = "is1b" # 石狩第2ゾーン
public_key_path="~/.ssh/id_ed25519.pub"
EOF
```

## 参考リンク

- [matsuu/cloud-init-isucon](https://github.com/matsuu/cloud-init-isucon)
- [さくらのナレッジ: ISUCON過去問題の環境を「さくらのクラウド」で構築する](https://knowledge.sakura.ad.jp/31520/)

## LICENSE

MIT
