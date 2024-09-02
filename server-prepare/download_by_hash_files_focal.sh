#!/bin/bash


BASE_URL="https://mirrors.aliyun.com/ubuntu-ports/dists/focal-updates/restricted/"

LOCAL_DIR="/var/www/html/ubuntu/mirror/mirrors.aliyun.com/ubuntu-ports/dists/focal-updates/restricted/"

FOLDERS_TO_DOWNLOAD=(
    "by-hash/SHA256/"  
 
)

mkdir -p "${LOCAL_DIR}"

download_recursive() {
    local folder="$1"
    local url="${BASE_URL}${folder}"
    local local_folder="${LOCAL_DIR}${folder}"

    mkdir -p "${local_folder}"

    echo "Downloading ${url} to ${local_folder}"

    wget -r -np -nH --cut-dirs=10 -P "${local_folder}" -R "index.html*" "${url}"
}

check_and_download() {
    local folder="$1"
    local url="${BASE_URL}${folder}"

    local files_exist=$(curl -s "${url}" | grep -Eo 'href="[^\"]+"' | grep -v 'href="index.html"' | wc -l)

    if [ "$files_exist" -gt 0 ]; then
        download_recursive "$folder"
    else
        echo "Folder ${folder} does not contain files or is empty."
    fi
}

for folder in "${FOLDERS_TO_DOWNLOAD[@]}"; do
    check_and_download "$folder"
done
