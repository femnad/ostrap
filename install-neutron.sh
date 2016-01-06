#!/bin/bash
repo_dir="$1"
cd "$repo_dir"
pip2 install -r requirements.txt
python2 setup.py install
