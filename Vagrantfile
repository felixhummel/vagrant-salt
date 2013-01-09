# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Configure the Salt Master VM
  config.vm.define :master do |master_config|
    # Configure the host name
    master_config.vm.host_name = "master.local"
    # Configure the box
    master_config.vm.box = "ubuntu-12.04.1-server-amd64-vagrant"
    # Setup the network
    master_config.vm.network :hostonly, "10.1.1.2"
    # Setup the script provisioner
    master_config.vm.provision :shell, :path => "master_setup.sh"
  end

  # Configure the Salt Minion VM
  config.vm.define :minion do |minion_config|
    # Configure the host name
    minion_config.vm.host_name = "minion.local"
    # Configure the box
    minion_config.vm.box = "ubuntu-12.04.1-server-amd64-vagrant"
    # Setup the network
    minion_config.vm.network :hostonly, "10.1.1.3"
    # Setup the script provisioner
    minion_config.vm.provision :shell do |shell|
      shell.path = "minion_setup.sh"
      shell.args = "10.1.1.2"
    end
  end

end
