# -*- mode: ruby -*-
# vi: set ft=ruby :

box      = "box-cutter/ubuntu1404-desktop"
hostname = 'Alvi2'
domain   = 'com'
ip       = '192.168.7.2'
ram      = '4096'

Vagrant.configure(2) do |config|

  config.vm.box = box
  config.vm.network "private_network", ip: ip
  config.vm.hostname = "www.alvi.com"
  config.hostsupdater.aliases = ["rails.alvi.com", "shipyard.alvi.com", "php.alvi.com", "node.alvi.com"]
  config.puppet_install.puppet_version = "3.7.5"
  
  config.vm.network "forwarded_port", guest: 80, host: 81
  config.vm.network "forwarded_port", guest: 3000, host: 3000
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

  config.vm.provision "docker"
  config.vm.provision "utilities_and_language", type: "shell" do |pro|
    pro.path = "./install-utilities.sh"
  end

  config.vm.provision "elixir_phoenix", type: "shell" do |pro|
    pro.path = "./elixir-phoenix.sh"
  end

  ## Provisioner: Puppet
  ### anyadir la clave para instalar RVM
  config.vm.provision "RVM keys", type: "shell" do |pro|
    pro.inline = "curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "site.pp"
  end

  config.vm.provision "ssh_keys", type: "shell" do |ssh|
    ssh.path = "./setup-keys.sh"
    ssh.privileged = false
  end

  #config.vm.provision "dockers", type: "shell" do |dock|
  #  dock.path = "./install-docker-images.sh"
  #end

  config.vm.provision "sublime_text", type: "shell" do |sub|
    sub.path = "./install-sublime.sh"
  end

  config.vm.provision "git_conf", type: "file" do |gu|
    gu.source = "_gitconfig"
    gu.destination = "~/.gitconfig"
  end

  config.vm.provision "java", type: "shell" do |j|
    j.path = "./install-java.sh"
  end

  config.vm.provision "uml", type: "shell" do |uml|
    uml.path= "./uml-utils.sh"
  end

  config.vm.provision "docker_images", type: "shell" do |di|
    di.path = "./install-docker-images.sh"
  end

  config.vm.provision "git-branch-bash", type: "file" do |gbb|
    gbb.source = "./_bash_profile"
    gbb.destination = "~/.bash_profile"
  end

end
