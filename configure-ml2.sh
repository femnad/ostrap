#!/bin/bash
ml2_config=/etc/neutron/plugins/ml2/ml2_conf.ini
crudini --set $ml2_config
crudini --set $ml2_config ml2 type_drivers flat,vlan,gre,vxlan
crudini --set $ml2_config ml2 tenant_network_types gre
crudini --set $ml2_config ml2 mechanism_drivers openvswitch

crudini --set $ml2_config ml2_type_gre tunnel_id_ranges 1:1000

crudini --set $ml2_config securitygroup enable_security_group True
crudini --set $ml2_config securitygroup enable_ipset True
crudini --set $ml2_config securitygroup firewall_driver neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver
