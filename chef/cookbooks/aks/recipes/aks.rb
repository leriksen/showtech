template "modules-k8s.conf" do
  source 'modules-k8s.conf.erb'
end

template "sysctl-k8s.conf" do
  source 'sysctl-k8s.conf.erb'
end

execute 'sysctl' do
  command '/usr/sbin/sysctl --system'
end

package "containerd"

execute 'package-update' do
  command "apt-get update --yes"
end

package "apt-transport-https"
package "ca-certificates"
package "curl"
package "gpg"

execute 'k8s-apt-gpg' do
  command "curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg"
end

execute 'k8s-apt-repo' do
  command "echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list"
end

execute 'refresh-repos' do
  command "apt-get update --yes"
end

package "kubelet"
package "kubeadm"
package "kubectl"

execute 'freeze kube tools' do
  command "apt-mark hold kubelet kubeadm kubectl"
end

