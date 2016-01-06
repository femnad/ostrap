#!/bin/bash
repo_dir="$1"
cd "$repo_dir"
mkdir -p /etc/neutron/plugins
cp etc/*.{ini,conf,json} /etc/neutron
cp -r etc/neutron/plugins/ml2 /etc/neutron/plugins
cp -r etc/neutron/rootwrap.d /etc/neutron
