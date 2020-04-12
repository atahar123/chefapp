# Cookbook:: chefapp
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'python3-pip'

remote_directory '/home/ubuntu/app' do
  source 'app'
  owner 'root'

  group 'root'
  mode '0777'
  action :create
end

bash 'pip install requirements.txt' do
  code <<-EOL
  pip3 install -r /home/ubuntu/app/requirements.txt
  EOL
end

directory '/home/ubuntu/Downloads' do
  owner 'root'
  group 'root'
  action :create
  mode '0777'
end
