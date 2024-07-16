#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
sudo dkms autoinstall jool/4.1.11 -k 6.8.11-300.fc40.x86_64