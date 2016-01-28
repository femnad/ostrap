#!/bin/bash
repo="$1"
cd $repo
python2 install setup.py install
pip2 install -r requirements.txt
