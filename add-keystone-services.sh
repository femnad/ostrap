#!/bin/bash
export OS_TOKEN=naber
export OS_URL=http://controller:35357/v2.0
openstack service create --name keystone --description "OpenStack Identity" identity
openstack endpoint create --publicurl http://controller:5000/v2.0 --internalurl http://controller:5000/v2.0 --adminurl http://controller:35357/v2.0 --region RegionOne identity
openstack project create --description "Admin Project" admin
openstack user create --password naber admin
openstack role create admin
openstack role add --project admin --user admin admin
openstack project create --description "Service Project" service
