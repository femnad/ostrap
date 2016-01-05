#!/bin/bash
set -e
local_ip="$1"
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
