#!/bin/bash
repo_dir="$1"
cd "$repo_dir"
pip2 install -r requirements.txt
python2 setup.py install
mkdir -p /etc/neutron/plugins
cp etc/*.{ini,conf,json} /etc/neutron
cp -r etc/neutron/plugins/ml2 /etc/neutron/plugins
cp -r etc/neutron/rootwrap.d /etc/neutron
