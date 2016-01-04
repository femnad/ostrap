#!/bin/bash
set -e
config_file=/etc/keystone/keystone.conf
crudini --set $config_file DEFAULT admin_token naber
crudini --set $config_file DEFAULT debug True
crudini --set $config_file DEFAULT log_dir /var/log/keystone
crudini --set $config_file database connection mysql://keystone:keystone@controller/keystone
crudini --set $config_file token keystone.token.providers.uuid.Provider
crudini --set $config_file driver keystone.token.persistence.backends.sql.Token
crudini --set $config_file driver keystone.contrib.revoke.backends.sql.Revoke
keystone-manage db_sync
