VERSION_ID := 1.0.0
CHANNEL    := alpha
KUBE_VERSION := 1.1.0

build-all: packer build coreos.json

build-virtualbox: packer build -only=virtualbox-iso coreos.json
build-parallels: packer build -only=virtualbox-iso coreos.json
build-googlecompute: packer build -only=googlecompute coreos.json

install:
	vagrant box add --force --provider=parallels --name stylelab-io/corekube-$(CHANNEL)--$(KUBE_VERSION) builds/parallels/coreos-$(CHANNEL).box
	vagrant box add --force --provider=virtualbox --name stylelab-io/corekube-$(CHANNEL)-$(KUBE_VERSION) builds/virtualbox/coreos-$(CHANNEL).box
