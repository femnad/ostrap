#!/bin/bash
set -e

interface_driver="$1"

l3_config=/etc/neutron/l3_agent.ini

crudini --set $l3_config DEFAULT "interface_driver neutron.agent.linux.interface.$interface_driver"
crudini --set $l3_config DEFAULT external_network_bridge
crudini --set $l3_config DEFAULT router_delete_namespaces True
crudini --set $l3_config DEFAULT debug True
