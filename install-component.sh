#!/bin/bash
set -e

repo_path="$1"
virtualenv_activator="$2"

cd "$repo_path"
source "$virtualenv_activator"
python setup.py install
pip install -r requirements.txt
