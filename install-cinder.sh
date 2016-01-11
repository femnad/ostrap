#!/bin/bash
set -e
repo_path="$1"
cd $repo_path
python setup.py install
pip2 install -r requirements.txt
