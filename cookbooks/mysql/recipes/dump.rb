#
# Cookbook Name:: mysql
# Recipe:: dump
#
# org llc, org.org
#
# Creates database for the specified user and imports  MySQL-dump into it



include_recipe "mysql::server"


file_name = node['mysql']['dumpfilename']


execute "dbcreate" do
  command "mysql -u #{node['mysql']['mysql_user_name']} -p#{node['mysql']['mysql_user_password']} -e \"CREATE DATABASE IF NOT EXISTS #{node['mysql']['db_name']}\""
  action :run
end

template "/tmp/#{file_name}" do
  source "#{file_name}"
  notifies :run, 'execute[import]', :immediately
  not_if do
    File.exist?('/tmp/#{file_name}')
  end
end

execute "import" do
  command "mysql -u #{node['mysql']['mysql_user_name']} -p#{node['mysql']['mysql_user_password']} #{node['mysql']['db_name']}< /tmp/#{file_name}"
  action :run    
end

file "/tmp/#{file_name}" do
  mode '0755'
  owner 'root'
  action :delete
end
