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
vmware-iso
googlecompute

## Requirements ##
VirtualBox > 5
VMware Fusion

## Building ##
To build run the following:

```
packer build coreos.json
```

You will be asked for you GCE account file and the project.

This will build CoreOS from the current channel, with the checksum of `560f13071604d492e19bbc9f0818713a`. To build from other channels run:

```
packer build \
  -parallel=false \
  -var 'channel=beta' \
  -var 'checksum=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
  -var 'gce_project_id=xxxxx-xxx'
  -var 'gce_account_file=~/your/account/files/project.json'
  coreos.json
```

## Variables ##
- channel - Can be set to `alpha`, `beta`, or `stable` **DEFAULT: alpha**
- coreos_version - The version of CoreOS **DEFAULT: 815.0.0**
- coreos_human_version - The CoreOS version for GCE regex **DEFAULT: 815.0.0**
- checksum_type - The checksum algorithm for the iso **DEFAULT: md5**
- checksum - The checksum of the latest iso **DEFAULT: da312c619cd7f47d148cc3af5b0bed38**
- kube_version - The Relase version of Kubernetes **DEFAULT: v1.0.6**
- kube_human_version - The Kubernetes version for GCE regex **DEFAULT: 1-0-6**
- gce_source_image ( Not generatable =( )- The name of the gce source image **DEFAULT: coreos-alpha-815-0-0-v20150924**
