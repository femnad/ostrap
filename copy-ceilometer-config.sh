#!/bin/bash
cd "$1/etc/ceilometer"
mkdir -p /etc/ceilometer
cp -r *.{ini,conf,yaml,json} rootwrap.d /etc/ceilometer
