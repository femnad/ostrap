#!/bin/bash
set -e
repo_dir="$1"
virtualenv="$2"

cd $repo_dir
source "$virtualenv/bin/activate"
pip install -r test-requirements.txt
./tools/config/generate_sample.sh
cp etc/nova/nova.conf.sample /etc/nova/nova.conf
cp etc/nova/{api-paste.ini,policy.json} /etc/nova/
