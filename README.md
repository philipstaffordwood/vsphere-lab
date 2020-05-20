# vSphere Lab

### Prerequisities

* 1Password configured with the organization vault
* OpenVPN client
* [SOPS](https://github.com/mozilla/sops) installed

### Setup OpenVPN

Get these files from 1Password:

* **Remote Client CA - vSphere VM OpenVPN VPN** - `fs-vpn-ca.crt`
* **Remote Client Cert - vSphere VM OpenVPN VPN** - `fs-remote-client.crt`
* **Remote Client Key - vSphere VM OpenVPN VPN** - `fs-remote-client.key`
* **Remote Client TLS Auth Key - vSphere VM OpenVPN VPN** - `tls-auth.key` 

Connect to the VPN using the configuration file `config.openvpn`. 

On linux run:

```bash
sudo openvpn config.openvpn
```

### Accessing the lab

1. Configure `AWS_SECRET_ACCESS_KEY` and `AWS_ACCESS_KEY_ID` with access to the SOPS KMS key.
(this can also be done with a [credentials file](https://docs.aws.amazon.com/sdk-for-php/v3/developer-guide/guide_credentials_profiles.html))

2. Start a session in a subshell with the environment variables set by running: `sops exec-env lab.enc.env '/bin/bash'`

3. Run

```shell
platform-cli kubeconfig admin -c green.yml -c lab.yml > green-admin.yml`
export KUBECONFIG=green-admin.yml
kubectl get nodes
```

### Updating environment variables:

1. Decrypt environment vars to `lab.env` with `sops -d lab.enc.env > lab.env`
2. Update the file
3. Run `sops -e lab.env > lab.enc.env`
4. Commit `lab.enc.env` NEVER COMMIT `lab.env`

### Lab Network Topology

![Network topolgy](./networking.png)
