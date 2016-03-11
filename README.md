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

  - /opt/kubernetes/kubectl
  - /opt/kubernetes/kubelet
  - /opt/kubernetes/kube-proxy
  - /opt/kubernetes/kube-apiserver
  - /opt/kubernetes/kube-controller-manager
  - /opt/kubernetes/linkcheck
  - /opt/kubernetes/kube-scheduler

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

`CHANNEL=stable KUBE_VERSION=1.1.7 make build`

### Defaults ###
  CoreOs Channel = alpha
  Kubernetes = newest kubernetes version from github

  **Warning!**
  If the kubernetes version from github has something like -patch or v1.x.x-beta5, the build will break! You should add the version you want!


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
