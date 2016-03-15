#!/bin/bash
set -e
repo_dir="$1"

cd $repo_dir
mkdir -p /etc/ceilometer
cp etc/ceilometer/*.{ini,yaml,json,conf} /etc/ceilometer
cp -r etc/ceilometer/rootwrap.d /etc/ceilometer
