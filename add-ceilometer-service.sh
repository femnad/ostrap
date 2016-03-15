#!/bin/bash
set -e
openrc_file="$1"
virtualenv_activate="$2"

source $openrc_file
source $virtualenv_activate
local_ip=$(ip r | grep default | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}')
openstack user create ceilometer --password ceilometer
openstack role add --project service --user ceilometer admin
openstack service create --name ceilometer --description "Telemetry" metering
openstack endpoint create --publicurl "http://$local_ip:8777" --internalurl http://controller:8777 --adminurl http://controller:8777 --region RegionOne metering
