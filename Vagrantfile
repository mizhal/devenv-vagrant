# -*- mode: ruby -*-
# vi: set ft=ruby :

box      = "box-cutter/ubuntu1404-desktop"
hostname = 'Alvi2'
domain   = 'com'
ip       = '192.168.7.2'
ram      = '4096'

Vagrant.configure(2) do |config|

  config.vm.box = box
  config.vm.hostname = hostname
  config.vm.network "private_network", ip: ip
  config.vm.hostname = "www.alvi.com"
  config.hostsupdater.aliases = ["rails.alvi.com", "shipyard.alvi.com", "php.alvi.com", "node.alvi.com"]

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9000, host: 9001
  config.vm.network "forwarded_port", guest: 5858, host: 5859
  config.vm.network "forwarded_port", guest: 65000, host: 65000
  ## docker registry
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  ## gitolite SSH
  config.vm.network "forwarded_port", guest: 2220, host: 2220

  config.vm.synced_folder ".", "/media/vagrant_shared"

  config.vm.define hostname
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = hostname
    v.memory = ram
    v.cpus = 2
    v.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
    v.customize ["modifyvm", :id, "--vram", "256"]
    ## usar las extensiones de virtualizacion de la CPU
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "shell", inline: 'localectl set-locale LANG=es_ES.utf8'
  config.vm.provision "docker"
  config.vm.provision "shell", path: "./install-utilities.sh"
end
