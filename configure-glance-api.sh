#!/bin/bash
config_file=/etc/glance/glance-api.conf
sudo crudini --set $config_file database connection mysql://glance:glance@controller/glance

sudo crudini --set $config_file keystone_authtoken auth_uri http://controller:5000
sudo crudini --set $config_file keystone_authtoken auth_url http://controller:35357
sudo crudini --set $config_file keystone_authtoken auth_plugin password
sudo crudini --set $config_file keystone_authtoken project_domain_id default
sudo crudini --set $config_file keystone_authtoken user_domain_id default
sudo crudini --set $config_file keystone_authtoken project_name service
sudo crudini --set $config_file keystone_authtoken username glance
sudo crudini --set $config_file keystone_authtoken password glance

sudo crudini --set $config_file paste_deploy flavor keystone

sudo crudini --set $config_file glance_store default_store file
sudo crudini --set $config_file glance_store filesystem_store_datadir /var/lib/glance/images/
sudo crudini --set $config_file DEFAULT notification_driver noop
sudo crudini --set $config_file DEFAULT debug True
