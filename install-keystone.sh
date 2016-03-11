#!/bin/bash
set -e

repo_dir="$1"
virtualenv="$2"
virtualenv $virtualenv
source "$virtualenv/bin/activate"
cd $repo_dir
python setup.py install
pip install -r requirements.txt
