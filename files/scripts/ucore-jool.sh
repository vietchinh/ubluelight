#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
GCC_VERSION="$(curl -sS "https://kojipkgs.fedoraproject.org/packages/gcc/" | grep -Poh -- '\d+.\d+.\d+\/' | sort -n | tail -1 | tr -d '\/' | tr -d '\n' | tr -d '\0')"
SUFFIX="$(curl -sS "https://kojipkgs.fedoraproject.org/packages/gcc/$GCC_VERSION/" | grep -Poh -- '\d.fc40' | tail -1 | tr -d '\n' | tr -d '\0')"
URL="https://kojipkgs.fedoraproject.org/packages/gcc/$GCC_VERSION/$SUFFIX/x86_64/libgcc-$GCC_VERSION-$SUFFIX.x86_64.rpm"
echo "$URL"
sudo rpm-ostree override replace "$URL"

git clone https://github.com/ublue-os/ucore.git

cp -a --verbose ucore/ucore/system_files/usr /
cp -a --verbose ucore/ucore/system_files/etc /

rm -rf ucore

sed -i '/^PRETTY_NAME/s/"$/ (uCore minimal)"/' /usr/lib/os-release