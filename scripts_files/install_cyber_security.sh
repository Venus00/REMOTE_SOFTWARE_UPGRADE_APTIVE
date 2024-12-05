#!/bin/bash

#install falcon
sudo dpkg -i ./falcon-sensor_7.15.0-16803_arm64.deb
sudo /opt/CrowdStrike/falconctl -s --cid=5CC10786A0F246C8B4D405B6034F5F91-31
sudo systemctl enable falcon-sensor
sudo systemctl start falcon-sensor
#install tanium
echo "Checking for ubuntu22-arm64"
COMMAND_RESULT=$(
  echo "$(uname -a 2>/dev/null)"
  echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"
  echo "$(uname -m 2>/dev/null)"
)
#echo "$COMMAND_RESULT" | grep -q "aarch64.*[Uu]buntu 22\.*"
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 22\.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "aarch64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.4.10.1075-ubuntu22_arm64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    sudo chown -R nextronic:nextronic /opt/Tanium/TaniumClient/
    cp /home/nextronic/tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    sudo systemctl enable taniumclient
    sudo systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
