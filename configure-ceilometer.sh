#!/bin/bash
config_file=/etc/ceilometer/ceilometer.conf

crudini --set $config_file database connection mongodb://ceilometer:ceilometer@controller:27017/ceilometer

crudini --set $config_file DEFAULT rpc_backend rabbit
crudini --set $config_file DEFAULT debug True
crudini --set $config_file DEFAULT auth_strategy keystone
crudini --set $config_file DEFAULT log_dir /var/log/ceilometer

crudini --set $config_file oslo_messaging_rabbit rabbit_host controller
crudini --set $config_file oslo_messaging_rabbit rabbit_userid guest
crudini --set $config_file oslo_messaging_rabbit rabbit_password guest

crudini --set $config_file keystone_authtoken auth_uri http://controller:5000/v2.0
crudini --set $config_file keystone_authtoken identity_uri http://controller:35357
crudini --set $config_file keystone_authtoken admin_tenant_name service
crudini --set $config_file keystone_authtoken admin_user ceilometer
crudini --set $config_file keystone_authtoken admin_password ceilometer

crudini --set $config_file notification store_events true

crudini --set $config_file service_credentials os_auth_url http://controller:5000/v2.0
crudini --set $config_file service_credentials os_username ceilometer
crudini --set $config_file service_credentials os_tenant_name service
crudini --set $config_file service_credentials os_password ceilometer
crudini --set $config_file service_credentials os_endpoint_type internalURL
crudini --set $config_file service_credentials os_region_name RegionOne

nova_config_file=/etc/nova/nova.conf
crudini --set $nova_config_file DEFAULT instance_usage_audit True
crudini --set $nova_config_file DEFAULT instance_usage_audit_period hour
crudini --set $nova_config_file DEFAULT notify_on_state_change vm_and_task_state
crudini --set $nova_config_file DEFAULT notification_driver messagingv2
