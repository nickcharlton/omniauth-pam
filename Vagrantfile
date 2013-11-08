# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'omniauth-pam'
  config.vm.box = 'boxes-wheezy64-chef'
  config.vm.box_url = 'http://boxes.nickcharlton.net/wheezy64-chef-virtualbox.box'

  # forward a port for testing
  config.vm.network "forwarded_port", guest: 5000, host: 8080, auto_correct: true

  # ensure the basic packages exist to get it all working
  config.vm.provision 'shell', inline: 'sudo apt-get -yqq install git libpam0g-dev;'\
                                        'sudo gem install bundler foreman'
end
