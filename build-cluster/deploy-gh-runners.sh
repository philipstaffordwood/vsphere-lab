#!/bin/bash
# Create secret:     gh-pats
# With key:          pat-fs-karina
# And secret data:   $GITHUB_TOKEN
kubectl delete secret gh-pats || echo "secret gh-pats didn't exist"
kubectl create secret generic gh-pats \
  --from-literal=pat-fs-karina=$GITHUB_TOKEN \
  --from-literal=aws-access-key-id=$AWS_ACCESS_KEY_ID \
  --from-literal=aws-secret-access-key=$AWS_SECRET_ACCESS_KEY
kubectl apply -f github-runner-deployment.yaml