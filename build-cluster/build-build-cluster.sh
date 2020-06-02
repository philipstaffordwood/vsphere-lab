#!/bin/bash
# Create Cluster Keys
karina ca generate --name root-ca --cert-path .certs/root-ca.crt --private-key-path .certs/root-ca.key --password foobar  --expiry 1
karina ca generate --name ingress-ca --cert-path .certs/ingress-ca.crt --private-key-path .certs/ingress-ca.key --password foobar

# Provision Cluster
karina provision vsphere-cluster -c build-cluster.yaml
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
