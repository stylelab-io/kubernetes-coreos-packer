################################################
#  Installs Kubernetes files to /opt/kubernetes
#  and adds the make-cert scripts
#

version=${KUBE_VERSION:-v1.0.6}

wget https://github.com/kubernetes/kubernetes/releases/download/${version}/kubernetes.tar.gz
tar -xvf kubernetes.tar.gz
sudo mkdir -p /opt/kubernetes/
tar -xvf ./kubernetes/server/kubernetes-salt.tar.gz
tar -xvf ./kubernetes/server/kubernetes-server-linux-amd64.tar.gz
sudo cp ./kubernetes/server/bin/hyperkube /opt/kubernetes/hyperkube
sudo cp ./kubernetes/server/bin/kubectl /opt/kubernetes/kubectl
sudo cp ./kubernetes/server/bin/kubelet /opt/kubernetes/kubelet
sudo cp .kubernetes/saltbase/salt/generate-cert/make-ca-cert.sh ./make-ca-cert.sh
sudo cp .kubernetes/saltbase/salt/generate-cert/make-cert.sh ./make-cert.sh
sudo chmod 775 /opt/kubernetes
echo "export PATH=/opt/kubernetes:\$PATH" > ~/.bashrc

rm -rf kubernetes kubernetes.tar.gz
