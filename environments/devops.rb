# environments/devops.rb 

name "devops"
description "For DevOps test work purposes"
#cookbook_versions({
#    "compat_resource" => "<= 12.0.0",
#    "apt" => "= 0.0.1"
#})
override_attributes ({
    "mysql" => {
	"mysql_hostname" => "localhost",
	"port" => "3306",
	"db_name" => "guestbook",
	"mysql_user_name" => "demo",
        "mysql_user_password" => "demodemo"
 
    },
    "JBoss" => {
        "dl_url" => "http://cumulogic.com/download/Apps/guestbookapp.zip",
	"app_name" => "guestbookapp.war",
	"db_hostname" => "MySqlGBDS",
	"mysql_user_name" => "demo",	
	"mysql_user_password" => "demodemo"	
    }
})
