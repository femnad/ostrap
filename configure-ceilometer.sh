#!/bin/bash
config_file=/etc/ceilometer/ceilometer.conf

sudo crudini --set $config_file database connection mongodb://ceilometer:ceilometer@controller:27017/ceilometer

sudo crudini --set $config_file DEFAULT rpc_backend rabbit
sudo crudini --set $config_file DEFAULT debug True
sudo crudini --set $config_file DEFAULT auth_strategy keystone

sudo crudini --set $config_file oslo_messaging_rabbit rabbit_host controller
sudo crudini --set $config_file oslo_messaging_rabbit rabbit_userid guest
sudo crudini --set $config_file oslo_messaging_rabbit rabbit_password guest

sudo crudini --set $config_file keystone_authtoken auth_uri http://controller:5000/v2.0
sudo crudini --set $config_file keystone_authtoken identity_uri http://controller:35357
sudo crudini --set $config_file keystone_authtoken admin_tenant_name service
sudo crudini --set $config_file keystone_authtoken admin_user ceilometer
sudo crudini --set $config_file keystone_authtoken admin_password ceilometer

sudo crudini --set $config_file service_credentials os_auth_url http://controller:5000/v2.0
sudo crudini --set $config_file service_credentials os_username ceilometer
sudo crudini --set $config_file service_credentials os_tenant_name service
sudo crudini --set $config_file service_credentials os_password ceilometer
sudo crudini --set $config_file service_credentials os_endpoint_type internalURL
sudo crudini --set $config_file service_credentials os_region_name RegionOne

nova_config_file=/etc/nova/nova.conf
sudo crudini --set $nova_config_file DEFAULT instance_usage_audit True
sudo crudini --set $nova_config_file DEFAULT instance_usage_audit_period hour
sudo crudini --set $nova_config_file DEFAULT notify_on_state_change vm_and_task_state
sudo crudini --set $nova_config_file DEFAULT notification_driver messagingv2
