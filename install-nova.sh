#!/bin/bash
set -e
repo_dir="$1"
virtualenv="$2"
if [[ ! -d $virtualenv ]]
then
    virtualenv $virtualenv
fi

cd "$repo_dir"
source "$virtualenv/bin/activate"
python2 setup.py install
pip2 install --upgrade pip
pip2 install -r requirements.txt
pip2 install -r test-requirements.txt
pip2 install libvirt-python
