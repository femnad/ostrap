#!/bin/bash
metadata_config=/etc/neutron/metadata_agent.ini
crudini --set $metadata_config DEFAULT auth_uri http://controller:5000
crudini --set $metadata_config DEFAULT auth_url http://controller:35357
crudini --set $metadata_config DEFAULT auth_region RegionOne
crudini --set $metadata_config DEFAULT auth_plugin password
crudini --set $metadata_config DEFAULT project_domain_id default
crudini --set $metadata_config DEFAULT user_domain_id default
crudini --set $metadata_config DEFAULT project_name service
crudini --set $metadata_config DEFAULT username neutron
crudini --set $metadata_config DEFAULT password neutron
crudini --set $metadata_config DEFAULT nova_metadata_ip controller
crudini --set $metadata_config DEFAULT debug True
