# zoneminder
Want a fully capable IP Video Surveillance System for pretty much free??

Setup Zoneminder on CentOS 7 in a Virtual Machine running on some spare old hardware.  

Prerequisites: VirtualBox Vagrant git

1.) # mkdir zoneminder; cd zoneminder

2.) # git clone https://github.com/jamiekowalczik/zoneminder.git

3.) update Vagrantfile with the appropriate bridge name (replace wlo1) and IP address.

4.) # vagrant up

5.) When the machine is fully setup browse to http://<IP Address>/zm - Setup a user account and Password!!
