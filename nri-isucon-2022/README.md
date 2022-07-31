# nri-isucon-2022 / NRI-ISUCON2022

さくらのクラウド上にNRI-ISUCON2022の環境を構築します。

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [matsuu/cloud-init-isucon/nri-isucon2022](https://github.com/matsuu/cloud-init-isucon/tree/main/nri-isucon2022)
* [nri-isucon2022 レギュレーション](https://github.com/nri-isucon/nri-isucon2022/blob/main/docs/regulation.md)
* [nri-isucon2022 当日マニュアル](https://github.com/nri-isucon/nri-isucon2022/blob/main/docs/manual.md)
* [nri-isucon2022 リポジトリ](https://github.com/nri-isucon/nri-isucon2022)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。
