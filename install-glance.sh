#!/bin/bash
set -e
repo_dir="$1"
cd "$repo_dir"
python2 setup.py install
pip2 install -r requirements.txt
