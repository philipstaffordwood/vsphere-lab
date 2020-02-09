# vSphere Lab

### Accessing the lab

1. Connect to the VPN
2. Configure `AWS_SECRET_ACCESS_KEY` and `AWS_ACCESS_KEY_ID` with access to the SOPS KMS key
3. Decrypt the environment variables by running: `source /dev/stdin < <( sops -d --input-type binary --output-type binary lab.enc.env )`
4. Run

```shell
platform-cli kubeconfig admin -c green.yml -c lab.yml > green-admin.yml`
export KUBECONFIG=green-admin.yml
kubectl get nodes
```

### Updating environment variables:

1. Decrypt environment vars to `lab.env` and update
2. Run `sops -e --input-type binary --output-type binary lab.env > lab.enc.env`
3. Commit `lab.enc.env` NEVER COMMIT `lab.env`
