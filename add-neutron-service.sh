#!/bin/bash
set -e
openstack user create --password neutron neutron
openstack role add --project service --user neutron admin
openstack service create --name neutron --description "OpenStack Networking" network
openstack endpoint create --publicurl http://controller:9696 --adminurl http://controller:9696 --internalurl http://controller:9696 --region RegionOne network
