################################################
#  Installs Kubernetes files to /opt/bin
#  and adds the make-cert scripts
#

version=${KUBE_VERSION:-v1.0.6}

wget https://github.com/kubernetes/kubernetes/releases/download/${version}/kubernetes.tar.gz
tar -xvf kubernetes.tar.gz
sudo mkdir -p /opt/kubernetes
tar -xvf ./kubernetes/server/kubernetes-salt.tar.gz
tar -xvf ./kubernetes/server/kubernetes-server-linux-amd64.tar.gz

sudo cp ./kubernetes/server/bin/kubectl /opt/bin/kubectl
sudo cp ./kubernetes/server/bin/kubelet /opt/bin/kubelet
sudo cp ./kubernetes/server/bin/kube-proxy /opt/bin/kube-proxy
sudo cp ./kubernetes/server/bin/kube-apiserver /opt/bin/kube-apiserver
sudo cp ./kubernetes/server/bin/kube-controller-manager /opt/bin/kube-controller-manager
sudo cp ./kubernetes/server/bin/linkcheck /opt/bin/linkcheck
sudo cp ./kubernetes/server/bin/kube-scheduler /opt/bin/kube-scheduler
sudo cp ./kubernetes/saltbase/salt/generate-cert/make-ca-cert.sh ./make-ca-cert.sh
sudo cp ./kubernetes/saltbase/salt/generate-cert/make-cert.sh ./make-cert.sh

echo "export PATH=/opt/bin:\$PATH" > ~/.bashrc

rm -rf kubernetes kubernetes.tar.gz
