#!/bin/bash
set -e
repo_dir="$1"
cd "$repo_dir"
mkdir -p /etc/glance
cp $repo_dir/etc/*.{conf,ini,json} /etc/glance
