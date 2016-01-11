#!/bin/bash
set -e
cd "$1"
mkdir -p /etc/cinder
cp etc/cinder/*.{ini,conf,json} /etc/cinder
cp etc/cinder/cinder.conf.sample /etc/cinder/cinder.conf
cp -r etc/cinder/rootwrap.d /etc/cinder
