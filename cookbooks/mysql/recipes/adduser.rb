#
# Cookbook Name:: mysql
# Recipe:: adduser
#
# org llc, org.org
#
# Creates a user and grants privileges
#


include_recipe "mysql::server"


execute "adduser" do
  command "mysql -u root -p#{node['mysql']['server_root_password']} -e \"CREATE USER '#{node['mysql']['mysql_user_name']}'@'localhost' IDENTIFIED BY '#{node['mysql']['mysql_user_password']}'\""
  action :run
  only_if { `/usr/bin/mysql -u root -p#{node['mysql']['server_root_password']} -D mysql -r -B -N -e \"SELECT COUNT(*) FROM user where User='#{node['mysql']['mysql_user_name']}'"`.to_i == 0 }
end


execute "adduserpriv" do
  command "mysql -u root -p#{node['mysql']['server_root_password']} -e \"GRANT ALL PRIVILEGES ON *.* TO '#{node['mysql']['mysql_user_name']}'@'localhost'\""
  action :run
end

