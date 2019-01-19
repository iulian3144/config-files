#!/bin/bash
# cli_install_extra.sh - install additional command-line interface (CLI) software for Ubuntu/Debian

# resynchronize the package index files from their sources and install them
apt-get -y update
apt-get -y dist-upgrade
apt-get -y autoremove

# Development tools
apt-get -y install build-essential cmake

# File archivers
apt-get -y install p7zip p7zip-full unrar-free unzip

# Terminal emulator
apt-get -y install terminator

# Text editors
apt-get -y install vim

# Python package manager
apt-get -y install pip
apt-get -y install pip3

# Git
apt-get -y install git

# Other useful tools
apt-get -y install htop pv tree

# TODO: something else may need to be added
