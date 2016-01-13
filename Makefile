VERSION_ID := 0.1.9
CHANNEL    := alpha
KUBE_VERSION := 1.1.3

build-all:
	packer build -var-file=vars.json corekube.json

build-virtualbox:
	packer build -only=virtualbox-iso -var-file=vars.json corekube.json
build-googlecompute:
	packer build -only=googlecompute -var-file=vars.json corekube.json

install:
	vagrant box add --force --provider=parallels --name stylelab-io/corekube-$(KUBE_VERSION)-$(VERSION_ID) builds/$(CHANNEL)/parallels/coreos-$(CHANNEL).box
	vagrant box add --force --provider=virtualbox --name stylelab-io/corekube-$(KUBE_VERSION)-$(VERSION_ID) builds/$(CHANNEL)/virtualbox/coreos-$(CHANNEL).box
