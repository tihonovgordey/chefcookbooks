#
# Cookbook Name:: JBoss
# Recipe:: default
#
# Copyright 2016, org llc, org.org
#
# All rights reserved - Do Not Redistribute
# Deploys Jboss, Java MySQL driver and application 


include_recipe 'apt'
include_recipe 'java'


# add jboss user
user 'jboss' do
  comment 'jboss User'		 	
  home '/usr/local/jboss'			
  system true 			 # system user - true 
  shell '/bin/false'		 # login shell, no shell access to user
end

directory '/usr/local/jboss' do
  recursive true
  action :delete
end

# download-n-unpack jboss 6.0.0 
ark 'jboss' do
  url 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-6.0.0.Final/jboss-as-distribution-6.0.0.Final.zip'
  owner 'jboss'
  version '6.0.0.Final'
end

apt_package 'libmysql-java'

link '/usr/local/jboss-6.0.0.Final/server/default/lib/mysql.jar' do
  to '/usr/share/java/mysql.jar'
end

template '/usr/local/jboss-6.0.0.Final/server/default/deploy/mysql-ds.xml' do
  source 'mysql-ds.erb'   
  owner 'jboss'
  mode '0755'
  not_if do
    File.exist?('/usr/local/jboss-6.0.0.Final/server/default/deploy/mysql-ds.xml')
  end

end

template '/usr/local/jboss-6.0.0.Final/bin/jboss_init_ubuntu.sh' do
  source 'jboss_init_ubuntu.sh'
  owner 'jboss'
  mode '0755'
  not_if do
    File.exist?('/usr/local/jboss-6.0.0.Final/bin/jboss_init_ubuntu.sh')
  end
end

ark 'guestbookapp' do
   url node['JBoss']['dl_url']
   creates node['JBoss']['app_name']
   path '/usr/local/jboss-6.0.0.Final/server/default/deploy'
   action :cherry_pick
 end

link '/etc/init.d/jboss' do
  to '/usr/local/jboss/bin/run.sh'
end

execute 'jboss-autostart' do
  command 'sudo update-rc.d jboss defaults'
end


