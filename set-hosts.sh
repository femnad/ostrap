#!/bin/bash
hostname="$1"
sed -i "s@\(127.0.0.1.*\)@\1 $hostname@" /etc/hosts
