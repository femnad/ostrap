#!/bin/bash
repo_dir="$1"
cd $repo_dir
pip install -r requirements.txt
python setup.py install
