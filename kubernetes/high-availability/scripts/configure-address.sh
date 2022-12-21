#!/bin/sh

# IP Inventory
K8S_VIP=10.15.0.10
K8S_API=k8s-api.beruanglaut.cloud
MASTER01=10.15.0.11
MASTER02=10.15.0.12
MASTER03=10.15.0.13
WORKER01=10.15.0.14
WORKER02=10.15.0.15
WORKER03=10.15.0.16

# Scripts
sed -i "s+K8S_VIP+$K8S_VIP" ../loadbalancer/check_apiserver.sh
