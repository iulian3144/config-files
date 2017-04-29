#!/bin/bash
# cli_install_extra.sh - install additional command-line interface (CLI) software for Ubuntu/Debian

# resynchronize the package index files from their sources and install them
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# Development tools
sudo apt-get -y build-essential cmake

# File archivers
sudo apt-get -y p7zip p7zip-full unrar-free unzip

# Terminal emulator
sudo apt-get -y install terminator

# Text editors
sudo apt-get -y install vim

# Python package manager
sudo apt-get -y install pip

# Git
sudo apt-get -y install git

# Other useful tools
sudo apt-get -y install htop pv tree

# TODO: something else may need to be added
