#!/bin/bash
config_file=/etc/glance/glance-registry.conf
crudini --set $config_file database connection mysql://glance:glance@controller/glance

crudini --set $config_file keystone_authtoken auth_uri http://controller:5000
crudini --set $config_file keystone_authtoken auth_url http://controller:35357
crudini --set $config_file keystone_authtoken auth_plugin password
crudini --set $config_file keystone_authtoken project_domain_id default
crudini --set $config_file keystone_authtoken user_domain_id default
crudini --set $config_file keystone_authtoken project_name service
crudini --set $config_file keystone_authtoken username glance
crudini --set $config_file keystone_authtoken password glance

crudini --set $config_file paste_deploy flavor keystone

crudini --set $config_file DEFAULT notification_driver noop
crudini --set $config_file DEFAULT debug True
