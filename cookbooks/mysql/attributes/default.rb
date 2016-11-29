#
default['mysql']['service_name'] = 'mysql'

# passwords
default['mysql']['server_root_password'] = '123456'
default['mysql']['server_debian_password'] = nil
default['mysql']['server_repl_password'] = nil

# used in grants.sql
default['mysql']['allow_remote_root'] = true
default['mysql']['remove_anonymous_users'] = true
default['mysql']['root_network_acl'] = nil

case node['platform']
when 'smartos'
  default['mysql']['data_dir'] = '/opt/local/lib/mysql'
else
  default['mysql']['data_dir'] = '/var/lib/mysql'
end

# port
default['mysql']['port'] = '3306'

# server package version and action
default['mysql']['server_package_version'] = nil
default['mysql']['server_package_action'] = 'install'

#userd for user create in adduser
default['mysql']['mysql_user_name'] = 'user'
default['mysql']['mysql_user_password'] = 'password' 

#used in dump import dump
default['mysql']['db_name'] = 'database'
default['mysql']['dumpfilename'] = 'guestbookmysqldump.sql'
