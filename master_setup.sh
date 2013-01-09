#!/bin/bash

echo 'Installing salt-master'
sudo apt-get update
sudo apt-get --yes install python-software-properties
sudo add-apt-repository --yes ppa:saltstack/salt
sudo apt-get update
sudo apt-get --yes install salt-master

echo 'Copying Salt Master config file to VM'
sudo cp /vagrant/master.conf /etc/salt/master

sudo service salt-master restart
