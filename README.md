## Test task files
### Files included
Provided cookbooks, environment and logs are in the appropriate folders. Also included vagrant file.
### Scheme
Vagrant VMs are executed on the Ubuntu linux machine. To access guest VM machine SSH to 213.184.245.66. To obtain username and password - check out e-mail. To run vagrant VM go to ~/vagrantProject folder. There is 3 VMs created: chef server (192.168.10.10 server.chef.local or chef), workstation (192.168.10.3 workstation.chef.local or workstation) and node (192.168.10.2 node.chef.local or node).
### Problems 
For some reasons knife bootstrap wont work with the --bootstrap-version parameter, so there is a need to update chef-client manually. Working on it
