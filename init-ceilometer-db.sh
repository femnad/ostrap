#!/bin/bash
set -e
mongo --host controller --eval '
db = db.getSiblingDB("ceilometer");
db.addUser({user: "ceilometer",
pwd: "ceilometer",
roles: [ "readWrite", "dbAdmin" ]})'
