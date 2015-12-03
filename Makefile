VERSION_ID := 0.1.0
CHANNEL    := alpha
KUBE_VERSION := 1.1.0

build-all:
	packer build -var-file=vars.json corekube.json

build-virtualbox:
	packer build -only=virtualbox-iso -var-file=vars.json corekube.json
build-googlecompute:
	packer build -only=googlecompute -var-file=vars.json corekube.json 

install:
	vagrant box add --force --provider=parallels --name stylelab-io/corekube-$(KUBE_VERSION)-$(VERSION_ID) builds/parallels/coreos-$(CHANNEL).box
	vagrant box add --force --provider=virtualbox --name stylelab-io/corekube-$(KUBE_VERSION)-$(VERSION_ID) builds/virtualbox/coreos-$(CHANNEL).box
