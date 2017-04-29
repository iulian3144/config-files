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
sudo apt-get -y install meld

# Graphics
sudo apt-get install -y blender gimp

# VLC player
sudo apt-get -y install vlc

# Skype
wget -P /tmp -O "skype_linux.deb" "https://go.skype.com/linux.deb"
sudo dpkg -i "skype_linux.deb"

# TODO: something else may need to be added
