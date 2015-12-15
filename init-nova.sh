#!/bin/bash
mysql -u boot -pborek -e 'CREATE DATABASE nova;'
mysql -u boot -pborek -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY 'nova';"
mysql -u boot -pborek -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY 'nova';"
source ~/y/admin-openrc.sh
openstack user create --password nova nova
openstack role add --project service --user nova admin
openstack service create --name nova --description "OpenStack Compute" compute
openstack endpoint create --publicurl http://controller:8774/v2/%\(tenant_id\)s --internalurl http://controller:8774/v2/%\(tenant_id\)s --adminurl http://controller:8774/v2/%\(tenant_id\)s --region RegionOne compute
