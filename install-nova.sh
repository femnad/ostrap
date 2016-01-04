#!/bin/bash
repo_dir="$1"
cd "$repo_dir"
python2 setup.py install
pip2 install -r requirements.txt
pip2 install -r test-requirements.txt
./tools/config/generate_sample.sh
mkdir -p /etc/nova
cp etc/nova/nova.conf.sample /etc/nova/nova.conf
cp etc/nova/{api-paste.ini,policy.json} /etc/nova/
