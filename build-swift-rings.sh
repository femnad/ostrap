#!/bin/bash
set -e
builder=$1
ip=$2
disk=$3
swift-ring-builder $builder.builder create 10 3 1
swift-ring-builder $builder.builder add r1z1-$ip:6002/$disk 100
