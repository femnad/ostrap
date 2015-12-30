#!/bin/bash
nova_config=/etc/nova/nova.conf

crudini --set $nova_config DEFAULT network_api_class nova.network.neutronv2.api.API
crudini --set $nova_config DEFAULT security_group_api neutron
crudini --set $nova_config DEFAULT linuxnet_interface_driver nova.network.linux_net.LinuxOVSInterfaceDriver
crudini --set $nova_config DEFAULT firewall_driver nova.virt.firewall.NoopFirewallDriver

crudini --set $nova_config neutron url http://controller:9696
crudini --set $nova_config neutron auth_strategy keystone
crudini --set $nova_config neutron admin_auth_url http://controller:35357/v2.0
crudini --set $nova_config neutron admin_tenant_name service
crudini --set $nova_config neutron admin_username neutron
crudini --set $nova_config neutron admin_password neutron
