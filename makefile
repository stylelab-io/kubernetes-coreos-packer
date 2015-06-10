VERSION_ID := 1.0.0
CHANNEL    := alpha

FILES = \
	files/box/change_host_name.rb \
	files/box/configure_networks.rb \
	files/box/Vagrantfile \
	files/cloud-config.yml \
	files/coreos-setup-environment \
	files/install.yml \
	files/vagrant

box: coreos.json builds/virtualbox/coreos-$(CHANNEL).box $(FILES)

builds/virtualbox/coreos-$(CHANNEL).box:
	packer build -only=virtualbox-iso coreos.json

install: builds/virtualbox/coreos-$(CHANNEL).box
	vagrant box add --force --provider=virtualbox --name wasbazi/coreos-$(CHANNEL) builds/virtualbox/coreos-$(CHANNEL).box

clean:
	rm -fr builds
	rm -fr packer_cache

.PHONY: box clean
