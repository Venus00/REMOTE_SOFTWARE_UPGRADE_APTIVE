#!/bin/bash

# Base URL for the packages
BASE_URL="https://mirrors.aliyun.com/ubuntu-ports/pool/main"

# Directory to save the downloaded packages
SAVE_DIR="/var/www/html/ubuntu/mirror/mirrors.aliyun.com/ubuntu-ports/pool/main"

# List of package paths (relative to BASE_URL)

PACKAGES=(
"c/command-not-found/command-not-found-data_18.04.6_arm64.deb"
"c/command-not-found/command-not-found_18.04.6_all.deb"
"c/command-not-found/python3-commandnotfound_18.04.6_all.deb"
"c/command-not-found/command-not-found-data_18.04.6_arm64.deb"
#"s/sox/libsox-fmt-mp3_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-alsa_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-base_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-pulse_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-oss_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-ao_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox3_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/sox_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-all_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox-fmt-all_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/libsox3_14.4.2-3ubuntu0.18.04.3_arm64.deb"
# "s/sox/sox_14.4.2-3ubuntu0.18.04.3_arm64.deb"
"g/glibc/libc6_2.27-3ubuntu1.5_arm64.deb"
"i/init-system-helpers/init-system-helpers_1.56+nmu1~ubuntu18.04.1_all.deb"
"g/glibc/locales_2.27-3ubuntu1.5_all.deb"
"g/glibc/libc-bin_2.27-3ubuntu1.5_arm64.deb"
"a/apt/libapt-pkg5.0_1.6.12ubuntu0.2_arm64.deb"
"a/apt/apt_1.6.12ubuntu0.2_arm64.deb"
"s/samba/libsmbclient_4.7.6+dfsg~ubuntu-0ubuntu2.28_arm64.deb"
"s/samba/samba-libs_4.7.6+dfsg~ubuntu-0ubuntu2.28_arm64.deb"
"s/samba/libwbclient0_4.7.6+dfsg~ubuntu-0ubuntu2.28_arm64.deb"
"o/openssh/openssh-sftp-server_7.6p1-4ubuntu0.5_arm64.deb"
"o/openssh/openssh-server_7.6p1-4ubuntu0.5_arm64.deb"
"o/openssh/openssh-client_7.6p1-4ubuntu0.5_arm64.deb"
"o/openssh/ssh_7.6p1-4ubuntu0.5_all.deb"
"g/glibc/multiarch-support_2.27-3ubuntu1.5_arm64.deb"
)  
for PACKAGE in "${PACKAGES[@]}"; do
    # Create the target directory if it doesn't exist
    TARGET_DIR="$SAVE_DIR/$(dirname "$PACKAGE")"
    mkdir -p "$TARGET_DIR"

    # Check if the file already exists
    FILE_PATH="$TARGET_DIR/$(basename "$PACKAGE")"
    if [ -f "$FILE_PATH" ]; then
        echo "File $FILE_PATH already exists. Skipping download."
    else
        # Download the file if it does not exist
        FILE_URL="$BASE_URL/$PACKAGE"
        echo "Downloading $FILE_URL to $TARGET_DIR/"
        wget -q -P "$TARGET_DIR" "$FILE_URL"
    fi
done

echo "Download completed!"
