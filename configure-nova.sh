#!/bin/bash
set -e
config_file=/etc/nova/nova.conf

crudini --set $config_file DEFAULT rpc_backend rabbit
crudini --set $config_file DEFAULT auth_strategy keystone
crudini --set $config_file DEFAULT debug True

crudini --set $config_file database connection mysql://nova:nova@controller/nova

crudini --set $config_file glance host controller

crudini --set $config_file keystone_authtoken
crudini --set $config_file keystone_authtoken auth_uri http://controller:5000
crudini --set $config_file keystone_authtoken auth_url http://controller:35357
crudini --set $config_file keystone_authtoken auth_plugin password
crudini --set $config_file keystone_authtoken project_domain_id default
crudini --set $config_file keystone_authtoken user_domain_id default
crudini --set $config_file keystone_authtoken project_name service
crudini --set $config_file keystone_authtoken username nova
crudini --set $config_file keystone_authtoken password nova

crudini --set $config_file oslo_concurrency lock_path /var/lib/nova/tmp

crudini --set $config_file oslo_messaging_rabbit
crudini --set $config_file oslo_messaging_rabbit rabbit_host controller
crudini --set $config_file oslo_messaging_rabbit rabbit_userid guest
crudini --set $config_file oslo_messaging_rabbit rabbit_password guest

nova-manage db sync
