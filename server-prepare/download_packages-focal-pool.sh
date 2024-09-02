#!/bin/bash

# Base URL for download
BASE_URL="https://mirrors.aliyun.com/ubuntu-ports/pool"

# Base directory to save the files
SAVE_DIR="/var/www/html/ubuntu/mirror/mirrors.aliyun.com/ubuntu-ports/pool/focal"

# Distributions to process
DISTRIBUTIONS=("focal" "focal-backports" "focal-security" "focal-updates")

# Folders to process
FOLDERS=("main" "multiverse" "restricted" "universe")

# File names to download
#FILES=("deb","Packages.gz" "Packages.xz" "Release")
FILES=("deb")
# Loop through each distribution
for DISTRO in "${DISTRIBUTIONS[@]}"; do
    # Loop through each folder within the distribution
    for FOLDER in "${FOLDERS[@]}"; do
        # Create the target directory if it doesn't exist
        TARGET_DIR="$SAVE_DIR/$DISTRO/$FOLDER/binary-arm64"
        mkdir -p "$TARGET_DIR"

        # Loop through each file and download it
        for FILE in "${FILES[@]}"; do
            FILE_URL="$BASE_URL/$DISTRO/$FOLDER/binary-arm64/$FILE"
            echo "Downloading $FILE_URL to $TARGET_DIR/"
            wget -q -P "$TARGET_DIR" "$FILE_URL"
        done
    done
done

echo "Download completed!"
