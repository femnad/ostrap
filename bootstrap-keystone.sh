#!/bin/bash
set -e
sudo mkdir -p /etc/keystone
config_dir=="/etc/keystone/"
config_file="/etc/keystone/keystone.conf"
sudo mkdir -p /var/log/keystone
sudo cp /home/femnad/z/gl/openstack/keystone/etc/keystone.conf.sample $config_file
sudo cp /home/femnad/z/gl/openstack/keystone/etc/keystone-paste.ini /etc/keystone/keystone-paste.ini
sudo cp /home/femnad/z/gl/openstack/keystone/etc/policy.json $config_dir
sudo keystone-manage db_sync
