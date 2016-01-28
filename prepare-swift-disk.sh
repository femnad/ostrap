#!/bin/bash
disk=$1
mkfs.xfs -f /dev/$disk
mkdir -p /srv/node/$disk
echo "/dev/$disk /srv/node/$disk xfs noatime,nodiratime,nobarrier,logbufs=8 0 2" >> /etc/fstab
mount /srv/node/$disk

