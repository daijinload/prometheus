#!/bin/sh -ex

mkdir tmp
cd tmp

wget https://github.com/prometheus/prometheus/releases/download/v1.7.2/prometheus-1.7.2.darwin-amd64.tar.gz
echo '8f892e3e9a806e6d58480a7e997662f511388fffcfbf59db861bdd24901e2b5c  prometheus-1.7.2.darwin-amd64.tar.gz' | shasum -a256 -c 
tar xvfz prometheus-*.tar.gz

wget https://github.com/prometheus/alertmanager/releases/download/v0.9.1/alertmanager-0.9.1.darwin-amd64.tar.gz
echo 'ab61f8266b2971629073e346d7d621a5fc91754391a7d0ec2906d1ef00e99114  alertmanager-0.9.1.darwin-amd64.tar.gz' | shasum -a256 -c 
tar xvfz alertmanager-*.tar.gz

wget https://github.com/prometheus/node_exporter/releases/download/v0.14.0/node_exporter-0.14.0.darwin-amd64.tar.gz
echo 'a2841d4cd2ab262d2e50192a2a32a9262afa8fc34680edb7531de042bab35328  node_exporter-0.14.0.darwin-amd64.tar.gz' | shasum -a256 -c 
tar xvfz node_exporter-*.tar.gz

wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.10.0/mysqld_exporter-0.10.0.darwin-amd64.tar.gz
echo 'e24cc24da54f05d84fe3ec7b2f6e6b93cc62850dd37ab15a91cc6c036efbea69  mysqld_exporter-0.10.0.darwin-amd64.tar.gz' | shasum -a256 -c 
tar xvfz mysqld_exporter-*.tar.gz

mv ./prometheus-1.7.2.darwin-amd64/console_libraries ../
mv ./prometheus-1.7.2.darwin-amd64/consoles/index.html.example ./prometheus-1.7.2.darwin-amd64/consoles/index.html
mv ./prometheus-1.7.2.darwin-amd64/consoles ../
mv ./prometheus-1.7.2.darwin-amd64/prometheus ../

mv ./alertmanager-0.9.1.darwin-amd64/alertmanager ../
mv ./node_exporter-0.14.0.darwin-amd64/node_exporter ../
mv ./mysqld_exporter-0.10.0.darwin-amd64/mysqld_exporter ../
