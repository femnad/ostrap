#!/bin/bash
set -e

repo_path="$1"
virtualenv_name="$2"

if [[ ! -d "$virtualenv_name" ]]
then
    virtualenv "$virtualenv_name"
fi

cd "$repo_path"
source "$virtualenv_activator/bin/activate"
python setup.py install
pip install -r requirements.txt
