#!/bin/bash

#append to sourcelist file
cat <<EOF >>/apt/etc/sources.list
deb http://10.121.29.107/mirror/mirrors.aliyun.com/ubuntu-ports/ impish main restricted universe multiverse
deb http://10.121.29.107/mirror/mirrors.aliyun.com/ubuntu-ports/ impish-updates main restricted universe multiverse
deb http://10.121.29.107/mirror/mirrors.aliyun.com/ubuntu-ports/ impish-security main restricted universe multiverse
EOF
