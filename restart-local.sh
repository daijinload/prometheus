#!/bin/sh 

rm -rf ./logs/*.log

sudo pkill alertmanager
sudo pkill prometheus
sudo pkill node_exporter
sudo pkill mysqld_exporter
sudo pkill blackbox_exporter

# alertmanager用
./alertmanager -config.file=./yamls/local/alertmanager.yml -storage.path=./data/alertmanager > ./logs/alertmanager.log 2>&1 &

# node用
./node_exporter > ./logs/node_exporter.log 2>&1 &

# mysql用
DATA_SOURCE_NAME='root:@(localhost:3306)/' ./mysqld_exporter > ./logs/mysqld_exporter.log 2>&1 & 

# ログの保存期間は90日。約3ヶ月を設定
./prometheus -config.file=./yamls/local/prometheus.yml \
    -storage.local.path=./data/prometheus \
    -storage.local.retention 2160h0m0s \
    -storage.local.series-file-shrink-ratio 0.3 \
    -web.console.templates ./consoles \
    -web.console.libraries ./console_libraries \
    > ./logs/prometheus.log 2>&1 &
