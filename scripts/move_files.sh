#!/usr/bin/env bash

sudo mkdir -p /opt/etcd
sudo mv etcd-ca /opt/etcd/etcd-ca
chmod 775 /opt/etcd/etcd-ca

sudo mkdir -p /opt/stylelounge
sudo mv metadata-downloader.sh /opt/stylelounge/metadata-downloader
chmod 775 /opt/stylelounge/metadata-downloader

sudo mkdir -p /opt/stvnwrgs
sudo mv locofo-linux64 /opt/stvnwrgs/locofo-linux64
chmod 775 /opt/stvnwrgs/locofo-linux64
