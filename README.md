#CoreOS-Kubernetes Packer#

Packer.io templates for CoreOS with Kubernetes installed. These are based on the following:

  - https://github.com/wasbazi/coreos-packer
  - https://github.com/coreos/coreos-overlay/tree/master/coreos-base/oem-vagrant
  - https://github.com/YungSang/coreos-packer
  - https://github.com/kevit/coreos-packer
  - https://github.com/barklyprotects/coreos-packer

## Pre installed ##

### Kubernetes ###
The following files will be deployed:

  - /opt/kubernetes/hyperkube (hyperkube is an all-in-one server binary)
  - /opt/kubernetes/kubectl
  - /opt/kubernetes/kubelet

### etcd ###
The following files will be deployed:

  - /opt/etcd/etcd-ca       => cert generation tool for etcd. see: https://github.com/coreos/etcd-ca


## Supported Builders ##
virtualbox-iso
vmware-iso // untested but should work too
googlecompute

## Requirements ##
Depending on what you want to build.
VirtualBox > 5
VMware Fusion
Google Compute Service Account and `gcloud`configured

Add `settings.json` with following content

```
{

}
```

## Configuration ##

To configure the channel and the kubernetes version:

`CHANNEL=stable; KUBE_VERSION=1.1.7; make build`

Default is alpha and 1.1.7

### Google ###
Add your `gce_project_id` and your `gce_account_file`

## Building ##
```
make build

make build-virtualbox
make build-vmware
make build-google

# install vagrant machines
```
