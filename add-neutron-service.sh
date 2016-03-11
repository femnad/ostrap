#!/bin/bash
set -e
openrc_file="$1"
virtualenv="$2"

source $openrc_file
source $virtualenv

openstack user create --password neutron neutron
openstack role add --project service --user neutron admin
openstack service create --name neutron --description "OpenStack Networking" network
openstack endpoint create --publicurl http://controller:9696 --adminurl http://controller:9696 --internalurl http://controller:9696 --region RegionOne network
