#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade 
sudo apt autoremove
sudo do-release-upgrade
sudo rm /var/lib/dpkg/info/usrmerge.* 
sudo apt-get -f install
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove


