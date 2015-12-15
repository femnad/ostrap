#!/bin/bash
cd ~/z/gl/openstack/glance
sudo python2 setup.py install
sudo pip2 install -r requirements.txt
sudo cp etc/glance-{api,registry}.conf /etc/glance
mysql -u boot -pborek -e 'create database glance'
mysql -u boot -pborek -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY 'glance';"
mysql -u boot -pborek -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY 'GLANCE_DBPASS';"
openstack user create --password-prompt glance
openstack role add --project service --user glance admin
openstack service create --name glance --description "OpenStack Image service" image
openstack endpoint create --publicurl http://controller:9292 --internalurl http://controller:9292 --adminurl http://controller:9292 --region RegionOne image
