#!/bin/bash

DOWNLOAD_DIR="/var/www/html/ubuntu/mirror"
urls=(
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy-updates/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy-security/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-updates/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-security/InRelease"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish/Release"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-updates/Release"
    # "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-security/Release"
    #"https://mirrors.aliyun.com/ubuntu-ports/pool/main/s/sysstat/sysstat_12.5.2-2ubuntu0.2_arm64.deb"    
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/python3-stdlib-extensions/python3-lib2to3_3.10.8-1~22.04_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/python3.10/libpython3.10-dev_3.10.12-1~22.04.5_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/python3-defaults/libpython3-dev_3.10.6-1~22.04.1_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/python3.10/python3.10-dev_3.10.12-1~22.04.5_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/n/node-jquery/libjs-jquery_3.6.0+dfsg+~3.5.13-1_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/u/underscore/libjs-underscore_1.13.2~dfsg-2_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/s/sphinx/libjs-sphinxdoc_4.3.2-1_all.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/python3-defaults/python3-dev_3.10.6-1~22.04.1_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/p/pycryptodome/python3-pycryptodome_3.11.0+dfsg1-3ubuntu0.1_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/k/keyrings.alt/python3-keyrings.alt_4.1.0-1_all.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/z/zlib/zlib1g-dev_1.2.11.dfsg-2ubuntu9.2_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/e/expat/libexpat1-dev_2.4.7-1ubuntu0.3_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/s/setuptools/python3-setuptools_59.6.0-1.2ubuntu0.22.04.1_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-defaults/python2-minimal_2.7.18-3_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-defaults/python2-dev_2.7.18-3_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-defaults/python2_2.7.18-3_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/python2.7-dev_2.7.18-13ubuntu1.2_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/python2.7_2.7.18-13ubuntu1.2_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/libpython2.7-dev_2.7.18-13ubuntu1.2_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/libpython2.7_2.7.18-13ubuntu1.2_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/libpython2.7-stdlib_2.7.18-13ubuntu1.2_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/python2.7-minimal_2.7.18-13ubuntu1.2_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python2.7/libpython2.7-minimal_2.7.18-13ubuntu1.2_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-defaults/libpython2-stdlib_2.7.18-3_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-defaults/libpython2-dev_2.7.18-3_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/liba/libappindicator/gir1.2-appindicator3-0.1_12.10.1+20.10.20200706.1-0ubuntu1_arm64.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/liba/libayatana-appindicator/gir1.2-ayatanaappindicator3-0.1_0.5.90-7ubuntu2_arm64.deb" 
"https://mirrors.aliyun.com/ubuntu-ports/pool/main/j/javascript-common/javascript-common_11+nmu1_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/w/wheel/python3-wheel_0.37.1-2ubuntu0.22.04.1_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/p/python-pip/python3-pip_22.0.2+dfsg-1ubuntu0.4_all.deb"
"https://mirrors.aliyun.com/ubuntu-ports/pool/universe/x/xfce4-xkb-plugin/xfce4-xkb-plugin_0.8.2-1_arm64.deb"
)
for url in "${urls[@]}"; do
    if [[ -z "$url" || "$url" == \#* ]]; then
        continue
    fi

    base_url=$(dirname "$url")

    file_name=$(basename "$url")

    folder_path="$DOWNLOAD_DIR/$(echo "$base_url" | sed 's|https://||;s|http://||')"
    echo "$base_url"
    echo "$file_name"
    echo "folder path : $folder_path"
    mkdir -p "$folder_path"
    echo "url : $url"
    #if [ -f "$folder_path/$file_name" ]; then
    #    echo "File $folder_path/$file_name already exists. Skipping download."
    #else
    wget --ca-directory=/etc/ssl/certs -P "$folder_path" "$url"
    #fi
    echo "Downloaded: $url to $folder_path/$file_name"
done
