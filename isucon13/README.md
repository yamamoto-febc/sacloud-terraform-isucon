# ISUCON13

さくらのクラウド上にISUCON13の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [cloud-init-isucon/isucon13/README](https://github.com/matsuu/cloud-init-isucon/blob/main/isucon13/README.md)
* [ISUCON13 レギュレーション](https://isucon.net/archives/57768216.html)
* [ISUCON13 当日マニュアル](https://github.com/isucon/isucon13/blob/c52b359fc6e733e1193ac8e9835bea23856566e7/docs/cautionary_note.md)
* [ISUCON13 アプリケーションマニュアル](https://github.com/isucon/isucon13/blob/c52b359fc6e733e1193ac8e9835bea23856566e7/docs/isupipe.md)
* [ISUCON13 リポジトリ](https://github.com/isucon/isucon13)
* 
## FAQ

- Q: ログインできない or 背景に何も表示されない
  - A: 初期データ投入が行われていないと発生するようです。手動でデータ投入するかベンチマークを起動してください。

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
