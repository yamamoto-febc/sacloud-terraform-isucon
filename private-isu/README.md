# private-isu / Pixiv社内ISUCON2016

さくらのクラウド上にPixiv社内ISUCON2016の環境を構築します。  
アプリケーションサーバとベンチマークを実行するサーバを分けて2台構築します。

- アプリケーションサーバ: 仮想CPUコア 2コア メモリ 4GB
- ベンチマークサーバ: 仮想CPUコア 4コア メモリ 8GB
- OS: Ubuntu 20.04

## 手順

トップページの[README](../README.md)を参照してください。

## 動作確認

サーバのIPアドレスは`terraform output ip_address`で確認できます。  
その後`ssh ubuntu@${サーバのIPアドレス}`でSSH接続出来るはずです。

こちらも合わせてご確認ください。

* [matsuu/cloud-init-isucon/private-isu](https://github.com/matsuu/cloud-init-isucon/tree/main/private-isu)
* [catatsuy/private-isu](https://github.com/catatsuy/private-isu/)

## 注意点

### パケットフィルターについて

デフォルトだとパケットフィルターは作成/適用されていません。  
必要に応じて各自で作成/適用してください。

### ネットワーク構成について

2台のサーバをそれぞれ100Mbps(Outbound)の帯域制限がついたネットワーク(共通セグメント)に繋げています。  
参考: [さくらのナレッジ: ISUCON過去問題の環境を「さくらのクラウド」で構築する](https://knowledge.sakura.ad.jp/31520/)  

このコードでは仮想スイッチを作成/サーバと接続するためのコードをコメントアウトしています。  
(デフォルトでは仮想スイッチは作成されません)  
必要に応じてコメントアウトを解除してご利用ください。  

:warning: 仮想スイッチに接続したNICに対するIPアドレス設定は各自で`netplan`などを利用して行う必要があります。  
上記のさくらのナレッジなどを参考に設定してください。

