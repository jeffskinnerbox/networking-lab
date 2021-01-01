#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.0.1
#


# install networking tools
apt-get -y install net-tools traceroute arp-scan

# json formatting tool
apt-get -y install jq

# packages which let apt get packages over HTTPS
apt -y install apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# add the docker repository to apt sources
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update the repository database
apt update

# make sure you are about to install from the docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# install the docker package
apt -y install docker-ce

# enabled docker daemon start on boot
systemctl enable docker

