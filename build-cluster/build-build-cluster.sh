#!/bin/bash
# Provision Cluster
karina provision vsphere-cluster -c build-cluster.yaml || exit 1
# Deploy CNI
karina deploy calico -c build-cluster.yaml
# Deploy Base
karina deploy base -c build-cluster.yaml
# Test Cluster
karina test all -c build-cluster.yaml
# Get KUBECONFIG
karina kubeconfig admin -c build-cluster.yaml > kubeconfig.yaml
export KUBECONFIG=$PWD/kubeconfig.yaml

./deploy-gh-runners.sh
