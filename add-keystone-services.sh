#!/bin/bash
set -e

os_token="$1"
virtualenv="$2"
password="$3"

source "$virtualenv/bin/activate"
export OS_TOKEN="$os_token"
export OS_URL=http://controller:35357/v2.0

openstack service create --name keystone --description "OpenStack Identity" identity
openstack endpoint create --publicurl http://controller:5000/v2.0 --internalurl http://controller:5000/v2.0 --adminurl http://controller:35357/v2.0 --region RegionOne identity
openstack project create --description "Admin Project" admin
openstack user create --password "$password" admin
openstack role create admin
openstack role add --project admin --user admin admin
openstack project create --description "Service Project" service
