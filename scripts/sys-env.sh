#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.0.1
#


# install NTP and set your time zone
apt-get -y install ntp
timedatectl set-timezone America/New_York

# install the trash utility
apt-get -y install trash-cli

# load firewall tool and utilities used by your bash shell
apt-get -y install ufw

# software version control tools (needed to load your tools)
apt-get -y install git

# install virtualbox guest tools giving you healthy screen resolution, integrated mouse, etc.
apt-get -y install build-essential virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms
