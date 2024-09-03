#!/bin/bash

#append to sourcelist file 
cat << EOF >> /apt/etc/sources.list
deb http://192.168.10.125/mirror/mirrors.aliyun.com/ubuntu-ports/ impish main restricted universe multiverse
deb http://192.168.10.125/mirror/mirrors.aliyun.com/ubuntu-ports/ impish-updates main restricted universe multiverse
deb http://192.168.10.125/mirror/mirrors.aliyun.com/ubuntu-ports/ impish-security main restricted universe multiverse
EOF

sudo apt update
sudo apt --allow-downgrades install wpasupplicant=2:2.9.0-21build1
sudo apt-mark hold wpasupplicant

