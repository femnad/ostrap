#!/bin/bash
set -e
controller_ip=$1
cinder_config=/etc/cinder/cinder.conf
mkdir -p /var/log/cinderr
crudini --set $cinder_config database connection mysql://cinder:cinder@controller/cinder

crudini --set $cinder_config DEFAULT rpc_backend rabbit
crudini --set $cinder_config DEFAULT auth_strategy keystone
crudini --set $cinder_config DEFAULT my_ip $controller_ip
crudini --set $cinder_config DEFAULT debug True
crudini --set $cinder_config DEFAULT enabled_backends nfs
crudini --set $cinder_config DEFAULT glance_host controller
crudini --set $cinder_config DEFAULT log_dir /var/log/cinder

crudini --set $cinder_config oslo_messaging_rabbit rabbit_host controller
crudini --set $cinder_config oslo_messaging_rabbit rabbit_userid rabbit
crudini --set $cinder_config oslo_messaging_rabbit rabbit_password guest

crudini --set $cinder_config keystone_authtoken auth_uri http://controller:5000
crudini --set $cinder_config keystone_authtoken auth_url http://controller:35357
crudini --set $cinder_config keystone_authtoken auth_plugin password
crudini --set $cinder_config keystone_authtoken project_domain_id default
crudini --set $cinder_config keystone_authtoken user_domain_id default
crudini --set $cinder_config keystone_authtoken project_name service
crudini --set $cinder_config keystone_authtoken username cinder
crudini --set $cinder_config keystone_authtoken password cinder

crudini --set $cinder_config oslo_concurrency lock_path /var/lock/cinder

crudini --set $cinder_config nfs volume_driver cinder.volume.drivers.nfs.NfsDriver

