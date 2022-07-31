# isucon12q / ISUCON12予選

さくらのクラウド上にISUCON12予選の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [cloud-init-isucon/isucon12q/README](https://github.com/matsuu/cloud-init-isucon/blob/main/isucon12q/README.md)
* [ISUCON12 レギュレーション](https://isucon.net/archives/56671734.html)
* [ISUCON12 予選当日マニュアル](https://gist.github.com/mackee/4320c18919c8f6f1867849378a17e651)
* [ISUCON12 予選リポジトリ](https://github.com/isucon/isucon12-qualify)

## FAQ

- ~ログインしようとしたら`502`エラーが出る~  
 (修正されていました: https://github.com/matsuu/cloud-init-isucon/commit/62892c5e6dfb2657205c620417e6274afc52cb76)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
