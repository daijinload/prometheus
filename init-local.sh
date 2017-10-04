#!/bin/sh 

sudo rm -rf ./logs/*.log

sudo pkill alertmanager
sudo pkill prometheus
sudo pkill node_exporter
sudo pkill mysqld_exporter
sudo pkill blackbox_exporter

sudo rm -rf ./data
