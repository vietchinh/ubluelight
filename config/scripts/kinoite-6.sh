#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.

# source: https://raw.githubusercontent.com/ublue-os/main/main/post-install.sh
systemctl enable rpm-ostreed-automatic.timer
systemctl enable flatpak-system-update.timer

systemctl --global enable flatpak-user-update.timer

cp /usr/share/ublue-os/update-services/etc/rpm-ostreed.conf /etc/rpm-ostreed.conf

ln -s "/usr/share/fonts/google-noto-sans-cjk-fonts" "/usr/share/fonts/noto-cjk"