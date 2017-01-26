#!/bin/bash
# gui_install_extra.sh - install additional GUI software for Ubuntu/Debian

# resynchronize the package index files from their sources and install them
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# my favorite terminal emulator
sudo apt-get -y terminator

# Sublime text
wget -P "/tmp/" "https://download.sublimetext.com/sublime-text_build-3126_amd64.deb"
sudo dpkg -i "/tmp/sublime-text_build-3126_amd64.deb"

# diff tool - Meld
sudo apt-get -y meld

# Graphics
sudo apt-get install -y blender gimp

# Skype
wget -P /tmp -O "skype-ubuntu-precise_4.3.0.37-1_i386.deb" "https://get.skype.com/go/getskype-linux-beta-ubuntu-64"
sudo dpkg -i "/tmp/skype-ubuntu-precise_4.3.0.37-1_i386.deb"

# TODO: something else may need to be added