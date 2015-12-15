#!/bin/bash
cd ~/z/gl/openstack/nova/
sudo python2 setup.py install
sudo pip2 install -r requirements.txt
sudo pip2 install -r test-requirements.txt
./tools/config/generate_sample.sh
sudo mkdir /etc/nova
sudo cp etc/nova/nova.conf.sample /etc/nova/nova.conf
sudo cp etc/nova/{api-paste.ini,policy.json} /etc/nova/
