#!/bin/bash
set -e
source "$1"
public_url = "$2"
openstack user create --password swift swift
openstack role add --project service --user swift admin
openstack service create --name swift --description "OpenStack Object Storage" object-store
openstack endpoint create --publicurl "http://$public_url:8080/v1/AUTH_%(tenant_id)s" \
          --internalurl 'http://controller:8080/v1/AUTH_%(tenant_id)s' \
          --adminurl http://controller:8080 --region RegionOne object-store
