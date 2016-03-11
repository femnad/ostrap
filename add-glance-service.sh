#!/bin/bash
set -e
openrc_file="$1"
virtualenv="$2"

source $openrc_file
source $virtualenv

openstack user create --password glance glance
openstack role add --project service --user glance admin
openstack service create --name glance --description "OpenStack Image service" image
openstack endpoint create --publicurl http://controller:9292 --internalurl http://controller:9292 --adminurl http://controller:9292 --region RegionOne image
