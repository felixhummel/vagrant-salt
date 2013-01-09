#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

min_name=`hostname -s`
echo 'Setting up Salt Minion with name: ' $min_name 

echo 'Salt Master IP address is ' $1

[ -f /vagrant/$min_name.conf ] || die "File: /vagrant/$min_name.conf does not exist"

echo 'Installing salt-minion'
sudo apt-get update
sudo apt-get --yes install python-software-properties
sudo add-apt-repository --yes ppa:saltstack/salt
sudo apt-get update
sudo apt-get --yes install salt-minion

sudo sed 's/#master: salt/master: '${1}'/g' /vagrant/$min_name.conf | sudo tee /etc/salt/minion > /dev/null

sudo service salt-minion start

echo 'Call state.highstate command to configure minion'
sudo salt-call state.highstate
