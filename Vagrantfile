# -*- mode: ruby -*-
# vi: set ft=ruby :

## Uncomment the following if running from Windows (tested on vagrant 1.8.6 with cygwin 64 [rsync,ssh])
ENV["VAGRANT_DETECTED_OS"] = ENV["VAGRANT_DETECTED_OS"].to_s + " cygwin"

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "zoneminder"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.network "public_network", ip: "192.168.2.134"
  # , use_dhcp_assigned_default_route: true
  # , ip: "192.168.200.127"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "2048"
     vb.name = "zoneminder"
  end

   config.vm.provision "shell", path: "scripts/bootstrap.sh"
end
