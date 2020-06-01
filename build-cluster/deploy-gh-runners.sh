#!/bin/bash
# Create secret:     gh-pats
# With key:          pat-fs-karina
# And secret data:   $GH_PAT
kubectl create secret generic gh-pats --from-literal=pat-fs-karina=$GH_PAT
kubectl apply -f github-runner-deployment.yaml