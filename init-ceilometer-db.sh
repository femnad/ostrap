#!/bin/bash
set -e

database="$1"
mongo --host controller --eval "
db = db.getSiblingDB(\"$database\");
db.addUser({user: \"ceilometer\",
pwd: \"ceilometer\",
roles: [ \"readWrite\", \"dbAdmin\" ]})"
