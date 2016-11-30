## Test task files
### Files included
Provided cookbooks, environment and logs are in the appropriate folders. Also included vagrant file.
### Scheme
Vagrant VMs are executed on the Ubuntu linux machine. To access host VM machine SSH to 213.184.245.66. To obtain username and password - check out e-mail. To run vagrant VM go to ~/vagrantProject folder. There is 3 VMs created: chef server (192.168.10.10 server.chef.local or chef), workstation (192.168.10.3 workstation.chef.local or workstation) and node (192.168.10.2 node.chef.local or node). 
### Operation
All three vagrant VMs a separated from the Internet and are able to work one with another only. There are three roles executed on node VM: PREPARE, MYSQL and JBOSS. After adding all three roles in nodes run list and changing nodes environment to `devops` all operations for preparation and setup of all needed complonents are automatic.  
### Problems 
For some reasons knife bootstrap wont work with the --bootstrap-version parameter, so there is a need to update chef-client manually. Working on it
