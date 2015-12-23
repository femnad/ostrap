#!/bin/bash
set -e
config_file="/etc/keystone/keystone.conf"
sudo crudini --set $config_file DEFAULT admin_token naber
sudo crudini --set $config_file DEFAULT debug True
sudo crudini --set $config_file DEFAULT log_dir /var/log/keystone
sudo crudini --set $config_file database connection mysql://keystone:keystone@controller/keystone
sudo crudini --set $config_file token keystone.token.providers.uuid.Provider
sudo crudini --set $config_file driver keystone.token.persistence.backends.sql.Token
sudo crudini --set $config_file driver keystone.contrib.revoke.backends.sql.Revoke
sudo keystone-manage db_sync
