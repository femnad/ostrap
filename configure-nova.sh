#!/bin/bash
set -e
config_file=/etc/nova/nova.conf

sudo crudini --set $config_file DEFAULT rpc_backend rabbit
sudo crudini --set $config_file DEFAULT auth_strategy keystone
sudo crudini --set $config_file DEFAULT verbose True

sudo crudini --set $config_file database connection mysql://nova:nova@controller/nova

sudo crudini --set $config_file glance host controller

sudo crudini --set $config_file keystone_authtoken
sudo crudini --set $config_file keystone_authtoken auth_uri http://controller:5000
sudo crudini --set $config_file keystone_authtoken auth_url = http://controller:35357
sudo crudini --set $config_file keystone_authtoken auth_plugin password
sudo crudini --set $config_file keystone_authtoken project_domain_id default
sudo crudini --set $config_file keystone_authtoken user_domain_id default
sudo crudini --set $config_file keystone_authtoken project_name service
sudo crudini --set $config_file keystone_authtoken username nova
sudo crudini --set $config_file keystone_authtoken password nova

sudo crudini --set $config_file oslo_messaging_rabbit
sudo crudini --set $config_file oslo_messaging_rabbit rabbit_host controller
sudo crudini --set $config_file oslo_messaging_rabbit rabbit_userid openstack
sudo crudini --set $config_file oslo_messaging_rabbit rabbit_password guest

sudo nova-manage db sync
