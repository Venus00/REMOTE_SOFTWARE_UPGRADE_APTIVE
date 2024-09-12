#!/bin/bash

URL_FILE="url_jammy.txt"
DOWNLOAD_DIR="/var/www/html/ubuntu/mirror"
urls=(
    "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy-updates/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/jammy-security/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-updates/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-security/InRelease"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish/Release"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-updates/Release"
    "https://mirrors.aliyun.com/ubuntu-ports/dists/impish-security/Release"

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
    if [ -f "$folder_path/$file_name" ]; then
        echo "File $folder_path/$file_name already exists. Skipping download."
    else
        wget -P "$folder_path" "$url"
    fi
    echo "Downloaded: $url to $folder_path/$file_name"
done <"$URL_FILE"
