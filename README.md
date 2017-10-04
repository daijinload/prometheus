# prometheus
テスト用Prometheus設定

# install

```bash
./install-mac.sh
./init-local.sh
./restart-local.sh
```

installは、mac用になってますが、linux用のバイナリにダウンロード対象を変更すれば
linuxmintでも動きます。（後で作成予定）

alertの設定ですが、ほとんどlinux環境用のものを設定しているので、
MacではProcessDown以外はほとんど動かないです。
Macで色々試したい場合、ルールを追加したり変更したりしてください。

# 概要

Prometheusは、マイクロサービスっぽくなっています。

- prometheus（本体）
- alertmanager（メールを送ったりする）
- node-exporter（各サーバのメモリ値など基本情報収集）
- mysql-exporter（MySQLサーバの情報を収集）

prometheusプロセスがnode-exporterやmysql-exporterにデータを取得に行き、
ルールに引っかかった場合、alertmanagerに通知する形です。

データの管理は、[LevelDBを使っているようです](https://prometheus.io/docs/introduction/faq/#why-does-prometheus-use-a-custom-storage-backend-rather-than-some-other-storage-method-isn-t-the-one-file-per-time-series-approach-killing-performance)
./data/にalertmanagerとPrometheusのフォルダを作って入れています。

# 注意点

### メール通知の確認
---

メール通知を確認するには、メール送信サーバが必要
Node.js製のツールである[MailDev](https://www.npmjs.com/package/maildev)などを
使って、送受信を確認出来る状態にする必要がある。

### MySQLの情報取得
---

設定的には、MySQLに情報を取りに行くため立ち上げる必要がある。
立ち上がって無くても動作はするため、見る必要が無ければ無視しておｋ。
