#!/bin/bash
set -e
repo_dir="$1"
virtualenv_script="$2"

cd "$repo_dir"
source "$virtualenv_script"
pip2 install -r requirements.txt
python2 setup.py install
