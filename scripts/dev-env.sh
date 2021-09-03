#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.0.1
#


# --------------- install your development libraries (as root) ---------------

# install needed compilers
apt-get -y install build-essential cmake unzip pkg-config
apt-get -y install gcc-6 g++-6

# install X windows libraries and OpenGL libraries
apt-get -y install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# install optimization algorithums libraries
apt-get -y install libopenblas-dev libatlas-base-dev liblapack-dev gfortran

# HDF5 library for working with large datasets
apt-get -y install libhdf5-serial-dev

# install image and video libraries
apt-get -y install libjpeg-dev libpng-dev libtiff-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get -y install libxvidcore-dev libx264-dev



# ----------------- install your development tools (as root) -----------------

# general development tools
apt-get -y install gnome-terminal jq markdown vim-gtk3 screen

# software version control tools
apt-get -y install git git-lfs

# install some networking tools
apt-get -y install net-tools

# install node.js and npm
apt-get -y install nodejs npm

# secure hash algorithms (SHA) tools, specifically SHA256
apt-get -y install hashalot

# install some X Window utilities
apt-get -y install x11-apps x11-xserver-utils xterm wmctrl

# tools for viewing and manipulating image & video files
apt-get -y install imagemagick feh mplayer

# load your favorate browser
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
wget -P /home/vagrant/.ssh/ https://dl.google.com/linux/linux_signing_key.pub
apt-key add /home/vagrant/.ssh/linux_signing_key.pub
apt-get -y update
apt-get -y install google-chrome-stable

