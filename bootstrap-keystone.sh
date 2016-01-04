#!/bin/bash
set -e
repo_dir="$1"
mkdir -p "/etc/keystone"
config_dir="/etc/keystone/"
config_file="/etc/keystone/keystone.conf"
mkdir -p /var/log/keystone
cp "$repo_dir/etc/keystone.conf.sample" $config_file
cp "$repo_dir/etc/keystone-paste.ini" /etc/keystone/keystone-paste.ini
cp "$repo_dir/etc/policy.json" $config_dir
