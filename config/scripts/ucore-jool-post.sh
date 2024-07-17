#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
KERNEL_VERSION="$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
JOOL_VERSION="$(rpm -qa jool --queryformat '%{VERSION}')"
sudo dkms autoinstall "jool/${JOOL_VERSION}" -k "${KERNEL_VERSION}"

sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

# workaround to enable cockpit web logins
rm /etc/ssh/sshd_config.d/40-disable-passwords.conf

# workaround until distrobox patch for this makes it into repos
ln -s  ../usr/share/zoneinfo/UTC /etc/localtime

# switch to server profile to allow cockpit by default
cp -a /etc/firewalld/firewalld-server.conf /etc/firewalld/firewalld.conf