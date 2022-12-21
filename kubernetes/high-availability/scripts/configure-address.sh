#!/bin/sh

# IP Inventory
K8S_VIP=10.15.0.10
K8S_API=k8s-api.beruanglaut.cloud
CLUSTER_NAME=beruanglaut-uat
MASTER01=10.15.0.11
MASTER02=10.15.0.12
MASTER03=10.15.0.13
WORKER01=10.15.0.14
WORKER02=10.15.0.15
WORKER03=10.15.0.16
METALLB_IPPOOL=10.15.0.200-10.15.0.250

# Scripts
sed -i "s+K8S_VIP+$K8S_VIP+g" \
playbooks/containerd-1.25.0.yaml \
playbooks/containerd-1.24.6.yaml \
loadbalancer/check_apiserver.sh \
loadbalancer/keepalived-master001.conf \
loadbalancer/keepalived-master002.conf \
loadbalancer/keepalived-master003.conf

sed -i "s+K8S_API+$K8S_API+g" \
manifests/kubeadm/kubernetes-1.15.9.yaml \
manifests/kubeadm/kubernetes-1.24.6.yaml \
manifests/kubeadm/kubernetes-1.25.0.yaml \
playbooks/containerd-1.25.0.yaml \
playbooks/containerd-1.24.6.yaml \
loadbalancer/check_apiserver.sh

sed -i "s+CLUSTER_NAME+$CLUSTER_NAME+g" \
manifests/kubeadm/kubernetes-1.15.9.yaml \
manifests/kubeadm/kubernetes-1.24.6.yaml \
manifests/kubeadm/kubernetes-1.25.0.yaml

sed -i "s+MASTER01+$MASTER01+g" hosts.yaml
sed -i "s+MASTER02+$MASTER02+g" hosts.yaml
sed -i "s+MASTER03+$MASTER03+g" hosts.yaml
sed -i "s+WORKER01+$WORKER01+g" hosts.yaml
sed -i "s+WORKER02+$WORKER02+g" hosts.yaml
sed -i "s+WORKER03+$WORKER03+g" hosts.yaml

sed -i "s+METALLB_IPPOOL+$METALLB_IPPOOL+g" manifests/metallb/metallb-config.yaml
