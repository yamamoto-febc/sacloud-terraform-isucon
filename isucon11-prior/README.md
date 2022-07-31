# isucon11-prior / ISUCON11事前講習

さくらのクラウド上にISUCON11事前講習の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [matsuu/cloud-init-isucon/isucon11-prior](https://github.com/matsuu/cloud-init-isucon/blob/main/isucon11-prior)
* [ISUCON11 予選リポジトリ](https://github.com/isucon/isucon11-prior)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
