#!/bin/bash
user="$1"
password="$2"
mysql -e "create user $user"
mysql -e "grant all on *.* to '$user'@'%' with grant option"
mysql -e "set password for '$user'@'%' = password('$password')"
