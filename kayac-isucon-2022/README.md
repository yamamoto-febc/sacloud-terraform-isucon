# kayac-isucon-2022 / Kayac社内ISUCON2022

さくらのクラウド上にKayac社内ISUCON2022の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [matsuu/cloud-init-kayac-isucon-2022](https://github.com/matsuu/cloud-init-kayac-isucon-2022)
* [kayac-isucon-2022レギュレーション＆当日マニュアル](https://github.com/kayac/kayac-isucon-2022/blob/main/docs/README.md)
* [kayac-isucon-2022リポジトリ](https://github.com/kayac/kayac-isucon-2022)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
