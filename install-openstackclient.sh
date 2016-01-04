#!/bin/bash
repo_dir="$1"
cd "$1"
pip install -r requirements.txt
python2 setup.py install
