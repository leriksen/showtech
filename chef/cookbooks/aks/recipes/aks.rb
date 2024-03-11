template "modules-k8s.conf" do
  source 'modules-k8s.conf.erb'
end

template "sysctl-k8s.conf" do
  source 'sysctl-k8s.conf.erb'
end

execute 'sysctl' do
  command '/usr/sbin/sysctl --system'
end