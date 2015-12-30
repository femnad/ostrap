#!/bin/bash
neutron_config=/etc/neutron/neutron.conf
crudini --set $neutron_config database connection mysql://neutron:neutron@controller/neutron
crudini --set $neutron_config DEFAULT rpc_backend rabbit
crudini --set $neutron_config DEFAULT auth_strategy keystone
crudini --set $neutron_config DEFAULT core_plugin ml2
crudini --set $neutron_config DEFAULT service_plugins router
crudini --set $neutron_config DEFAULT allow_overlapping_ips True
crudini --set $neutron_config DEFAULT notify_nova_on_port_status_changes True
crudini --set $neutron_config DEFAULT notify_nova_on_port_data_changes True
crudini --set $neutron_config DEFAULT nova_url http://controller:8774/v2
crudini --set $neutron_config DEFAULT debug True

crudini --set $neutron_config oslo_messaging_rabbit rabbit_host controller
crudini --set $neutron_config oslo_messaging_rabbit rabbit_userid guest
crudini --set $neutron_config oslo_messaging_rabbit rabbit_password guest

crudini --set $neutron_config keystone_authtoken
crudini --set $neutron_config keystone_authtoken auth_uri http://controller:5000
crudini --set $neutron_config keystone_authtoken auth_url http://controller:35357
crudini --set $neutron_config keystone_authtoken auth_plugin password
crudini --set $neutron_config keystone_authtoken project_domain_id default
crudini --set $neutron_config keystone_authtoken user_domain_id default
crudini --set $neutron_config keystone_authtoken project_name service
crudini --set $neutron_config keystone_authtoken username neutron
crudini --set $neutron_config keystone_authtoken password neutron

crudini --set $neutron_config nova auth_url http://controller:35357
crudini --set $neutron_config nova auth_plugin password
crudini --set $neutron_config nova project_domain_id default
crudini --set $neutron_config nova user_domain_id default
crudini --set $neutron_config nova region_name RegionOne
crudini --set $neutron_config nova project_name service
crudini --set $neutron_config nova username nova
crudini --set $neutron_config nova password nova
