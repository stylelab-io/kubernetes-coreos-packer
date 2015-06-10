CoreOS-Packer
=============

Packer.io templates for CoreOS. These are based on the following:

  - https://github.com/coreos/coreos-overlay/tree/master/coreos-base/oem-vagrant
  - https://github.com/YungSang/coreos-packer
  - https://github.com/kevit/coreos-packer

Currently only VirtualBox is supported.

Requirements
============

VirtualBox

Building
========

To build run the following:

```
packer build coreos.json
```

This will build CoreOS from the current channel, with the checksum of `560f13071604d492e19bbc9f0818713a`. To build from other channels run:

```
packer build \
  -parallel=false \
  -var 'channel=beta' \
  -var 'checksum=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  coreos.json
```

Variables
=========
- channel - Can be set to `alpha`, `beta`, or `stable` **DEFAULT: stable**
- version - The version of CoreOS **DEFAULT: current**
- checksum_type - The checksum algorithm for the iso **DEFAULT: md5**
- checksum - The checksum of the latest iso **DEFAULT: 560f13071604d492e19bbc9f0818713a**
