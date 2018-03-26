# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  ansible_node = <<-HERE
  sudo dnf group install -y "Ansible node"
  sudo dnf install -y python2-libselinux
  HERE
  
  config.vm.define :server do |s|
    s.vm.box = "f28"
    s.vm.synced_folder ".", "/vagrant", disabled: true
    s.vm.network :private_network, ip: '192.168.127.10'
    s.vm.provision :shell, inline: ansible_node
    s.vm.provision :ansible, playbook: 'pppoe-setup/server.yml'
  end

  config.vm.define :client do |c|
    c.vm.box = "f28"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.network :private_network, ip: '192.168.127.20', auto_config: false
    c.vm.provision :shell, inline: ansible_node
    c.vm.provision :ansible, playbook: 'pppoe-setup/client.yml'
  end
end
