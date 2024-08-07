#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
#sudo rpm-ostree override replace https://kojipkgs.fedoraproject.org//packages/gcc/14.1.1/7.fc40/x86_64/libgcc-14.1.1-7.fc40.x86_64.rpm

git clone https://github.com/ublue-os/ucore.git

cp -a --verbose ucore/ucore/usr /

rm -rf ucore

sed -i '/^PRETTY_NAME/s/"$/ (uCore minimal)"/' /usr/lib/os-release