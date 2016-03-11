#!/bin/bash
set -e
repo_dir="$1"
virtualenv_dir="$2"
cd "$1"
source "$virtualenv_dir/bin/activate"
pip install -r requirements.txt
python2 setup.py install
