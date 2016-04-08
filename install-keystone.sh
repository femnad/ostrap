#!/bin/bash
set -e

repo_dir="$1"
virtualenv="$2"
if [[ ! -d $virtualenv ]]
then
    virtualenv $virtualenv
fi
source "$virtualenv/bin/activate"
cd $repo_dir
python2 setup.py install
pip2 install --upgrade pip
pip2 install -r requirements.txt
