#!/bin/bash
set -e
sudo mkdir -p /etc/keystone
config_dir=="/etc/keystone/"
config_file="/etc/keystone/keystone.conf"
sudo mkdir -p /var/log/keystone
sudo cp /home/femnad/z/gl/openstack/keystone/etc/keystone.conf.sample $config_file
sudo cp /home/femnad/z/gl/openstack/keystone/etc/keystone-paste.ini /etc/keystone/keystone-paste.ini
sudo cp /home/femnad/z/gl/openstack/keystone/etc/policy.json $config_dir
sudo crudini --set $config_file DEFAULT admin_token naber
sudo crudini --set $config_file DEFAULT debug True
sudo crudini --set $config_file DEFAULT log_dir /var/log/keystone
sudo crudini --set $config_file database connection mysql://keystone:keystone@controller/keystone
sudo crudini --set $config_file token keystone.token.providers.uuid.Provider
sudo crudini --set $config_file driver keystone.token.persistence.backends.sql.Token
sudo crudini --set $config_file driver keystone.contrib.revoke.backends.sql.Revoke
sudo keystone-manage db_sync keystone
