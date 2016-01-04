#!/bin/bash
set -e
source "$1"
openstack user create ceilometer --password ceilometer
openstack role add --project service --user ceilometer admin
openstack service create --name ceilometer --description "Telemetry" metering
openstack endpoint create --publicurl http://controller:8777 --internalurl http://controller:8777 --adminurl http://controller:8777 --region RegionOne metering
