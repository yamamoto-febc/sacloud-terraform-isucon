# isucon10q / ISUCON10予選

さくらのクラウド上にISUCON10予選の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [matsuu/cloud-init-isucon/isucon10q](https://github.com/matsuu/cloud-init-isucon/blob/main/isucon10q)
* [ISUCON10 予選当日マニュアル](https://gist.github.com/progfay/25edb2a9ede4ca478cb3e2422f1f12f6)
* [ISUCON10 予選リポジトリ](https://github.com/isucon/isucon10-qualify)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
