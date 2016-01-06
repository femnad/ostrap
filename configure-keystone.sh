#!/bin/bash
set -e
admin_token="$1"
config_file=/etc/keystone/keystone.conf

crudini --set $config_file DEFAULT admin_token $admin_token
crudini --set $config_file DEFAULT debug True
crudini --set $config_file DEFAULT log_dir /var/log/keystone

crudini --set $config_file database connection mysql://keystone:keystone@controller/keystone

crudini --set $config_file memcache servers localhost:11211

crudini --set $config_file token provider keystone.token.providers.uuid.Provider
crudini --set $config_file token driver keystone.token.persistence.backends.memcache.Token

crudini --set $config_file revoke driver keystone.contrib.revoke.backends.sql.Revoke
