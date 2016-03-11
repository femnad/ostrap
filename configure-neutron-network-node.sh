#!/bin/bash
set -e
local_ip=$(ip r | grep default | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}')

neutron_config=/etc/neutron/neutron.conf
crudini --set $neutron_config database connection mysql://neutron:neutron@controller/neutron
crudini --set $neutron_config DEFAULT rpc_backend rabbit
crudini --set $neutron_config DEFAULT auth_strategy keystone
crudini --set $neutron_config DEFAULT core_plugin ml2
crudini --set $neutron_config DEFAULT service_plugins router
crudini --set $neutron_config DEFAULT allow_overlapping_ips True
crudini --set $neutron_config DEFAULT notify_nova_on_port_status_changes True
crudini --set $neutron_config DEFAULT notify_nova_on_port_data_changes True
crudini --set $neutron_config DEFAULT nova_url http://controller:8774/v2
crudini --set $neutron_config DEFAULT debug True
crudini --set $neutron_config DEFAULT log_dir /var/log/neutron/
crudini --set $neutron_config DEFAULT state_path /var/lib/neutron/

crudini --set $neutron_config oslo_messaging_rabbit rabbit_host controller
crudini --set $neutron_config oslo_messaging_rabbit rabbit_userid guest
crudini --set $neutron_config oslo_messaging_rabbit rabbit_password guest

crudini --set $neutron_config keystone_authtoken auth_uri http://controller:5000
crudini --set $neutron_config keystone_authtoken auth_url http://controller:35357
crudini --set $neutron_config keystone_authtoken auth_plugin password
crudini --set $neutron_config keystone_authtoken project_domain_id default
crudini --set $neutron_config keystone_authtoken user_domain_id default
crudini --set $neutron_config keystone_authtoken project_name service
crudini --set $neutron_config keystone_authtoken username neutron
crudini --set $neutron_config keystone_authtoken password neutron

crudini --set $neutron_config nova auth_url http://controller:35357
crudini --set $neutron_config nova auth_plugin password
crudini --set $neutron_config nova project_domain_id default
crudini --set $neutron_config nova user_domain_id default
crudini --set $neutron_config nova region_name RegionOne
crudini --set $neutron_config nova project_name service
crudini --set $neutron_config nova username nova
crudini --set $neutron_config nova password nova

ml2_config=/etc/neutron/plugins/ml2/ml2_conf.ini
crudini --set $ml2_config ml2 type_drivers flat,vlan,gre,vxlan
crudini --set $ml2_config ml2 tenant_network_types gre
crudini --set $ml2_config ml2 mechanism_drivers openvswitch
crudini --set $ml2_config ml2_type_gre tunnel_id_ranges 1:1000
crudini --set $ml2_config ovs local_ip $local_ip
crudini --set $ml2_config ovs bridge_mappings external:br-ex
crudini --set $ml2_config agent tunnel_types gre

l3_config=/etc/neutron/l3_agent.ini
crudini --set $l3_config DEFAULT interface_driver neutron.agent.linux.interface.OVSInterfaceDriver
crudini --set $l3_config DEFAULT external_network_bridge
crudini --set $l3_config DEFAULT router_delete_namespaces True
crudini --set $l3_config DEFAULT debug True

dhcp_config=/etc/neutron/dhcp_agent.ini
crudini --set $dhcp_config DEFAULT interface_driver neutron.agent.linux.interface.OVSInterfaceDriver
crudini --set $dhcp_config DEFAULT dhcp_driver neutron.agent.linux.dhcp.Dnsmasq
crudini --set $dhcp_config DEFAULT dhcp_delete_namespaces True
crudini --set $dhcp_config DEFAULT debug True

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
