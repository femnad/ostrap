#!/bin/bash
set -e
repo_dir="$1"
virtualenv="$2"

cd "$repo_dir"
source "$virtualenv/bin/activate"
python2 setup.py install
pip2 install -r requirements.txt
