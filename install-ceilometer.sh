#!/bin/bash
set -e
repo_dir="$1"
cd $repo_dir
pip2 install -r requirements.txt
python2 setup.py install
tox -egenconfig
mkdir -p /etc/ceilometer
cp etc/ceilometer/*.{ini,yaml,json,conf} /etc/ceilometer
cp -r etc/ceilometer/rootwrap.d /etc/ceilometer
