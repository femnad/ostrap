#!/bin/bash
set -e
openrc_file="$1"
virtualenv="$2"

source "$virtualenv/bin/activate"
source "$openrc_file"

openstack user create --password nova nova
openstack role add --project service --user nova admin
openstack service create --name nova --description "OpenStack Compute" compute
openstack endpoint create --publicurl http://controller:8774/v2/%\(tenant_id\)s --internalurl http://controller:8774/v2/%\(tenant_id\)s --adminurl http://controller:8774/v2/%\(tenant_id\)s --region RegionOne compute
