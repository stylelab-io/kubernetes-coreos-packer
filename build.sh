#! /bin/bash
TARGETS=${1:-virtualbox-iso,googlecompute,vmware-iso}
CHANNEL=${CHANNEL:-alpha}
KUBE_VERSION=${KUBE_VERSION:-}

# get all coreos infos
MD5=$(curl -s http://${CHANNEL}.release.core-os.net/amd64-usr/current/coreos_production_iso_image.iso.DIGESTS | sed -n 2p | awk '{print $1}')
VERSION_FULL=$(curl -s http://${CHANNEL}.release.core-os.net/amd64-usr/current/version.txt)

COREOS_BUILD=$(echo $VERSION_FULL | awk '{print $1}' | cut -d "=" -f 2 )
COREOS_BRANCH=$(echo $VERSION_FULL | awk '{print $2}' | cut -d "=" -f 2 )
COREOS_PATCH=$(echo $VERSION_FULL | awk '{print $3}' | cut -d "=" -f 2 )

GOOGLE_IMAGE=$(gcloud compute images list |grep coreos-cloud |grep ${CHANNEL} | awk '{print $1}')


# get newest tag from kubernetes
if [[ -z "${KUBE_VERSION}" ]]; then
  # get releases as json, grep 1. line with tag_name, get value, remove leading '"v' , remove ending '"'
  KUBE_VERSION=$(curl -s https://api.github.com/repos/kubernetes/kubernetes/releases | grep -m 1 'tag_name' | awk '{print $2}' | cut -d "v" -f 2 | sed 's/".*//' )
  KUBE_MAJOR=$(echo ${KUBE_VERSION} | cut -d "." -f 1)
  KUBE_MINOR=$(echo ${KUBE_VERSION} | cut -d "." -f 2)
  KUBE_PATCH=$(echo ${KUBE_VERSION} | sed "s/${KUBE_MAJOR}.${KUBE_MINOR}.//")
fi

echo "CoreOS Version is: ${COREOS_BUILD}.${COREOS_BRANCH}.${COREOS_PATCH}"
echo "CoreOS iso MD5:${MD5}"
echo "CoreOS Google Image name: ${GOOGLE_IMAGE}"

echo "Kubernetes Version is:  ${KUBE_MAJOR}.${KUBE_MINOR}.${KUBE_PATCH}"

echo "Start building image!"
packer build  \
  -var-file=$PWD/settings.json \
  -var "kube_version=v${KUBE_MAJOR}.${KUBE_MINOR}.${KUBE_PATCH}" \
  -var "kube_human_version=${KUBE_MAJOR}-${KUBE_MINOR}-${KUBE_PATCH}" \
  -var "channel=${CHANNEL}" \
  -var "coreos_version=${COREOS_BUILD}.${COREOS_BRANCH}.${COREOS_PATCH}" \
  -var "coreos_human_version=${COREOS_BUILD}-${COREOS_BRANCH}-${COREOS_PATCH}" \
  -var "checksum_type=md5" \
  -var "checksum=${MD5}" \
  -var "gce_source_image=${GOOGLE_IMAGE}" \
  -only=${TARGETS} \
  coreos.json
