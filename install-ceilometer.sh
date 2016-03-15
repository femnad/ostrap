#!/bin/bash
set -e
repo_dir="$1"
virtualenv="$2"

source $virtualenv
cd $repo_dir
pip2 install -r requirements.txt
python2 setup.py install

pip install tox
tox -egenconfig

pip install pymongo
