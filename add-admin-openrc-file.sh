#!/bin/bash
set -e

openrc_dir="$1"
openrc_file="$2"
admin_pass="$3"

mkdir -p "$openrc_dir"

cat > $openrc_file << EOF
export OS_PROJECT_NAME=admin
export OS_TENANT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=$admin_pass
export OS_AUTH_URL=http://controller:35357/v2.0
EOF
