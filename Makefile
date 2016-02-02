build:
	./build.sh

build-virtualbox:
	./build.sh virtualbox-iso
build-vmware:
	./build.sh vmware-iso
build-google:
	./build.sh googlecompute

install:
	vagrant box add --force --provider=parallels --name stylelab-io/corekube-$(CHANNEL)--$(KUBE_VERSION) builds/parallels/coreos-$(CHANNEL).box
	vagrant box add --force --provider=virtualbox --name stylelab-io/corekube-$(CHANNEL)-$(KUBE_VERSION) builds/virtualbox/coreos-$(CHANNEL).box
