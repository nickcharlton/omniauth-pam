# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "omniauth-pam"
  config.vm.box = "boxesio/ruby"

  config.vm.network "forwarded_port", guest: 5000,
                                      host: 8080,
                                      auto_correct: true

  config.vm.provision "shell", inline: "sudo apt-get -yq install libpam0g-dev"
end
