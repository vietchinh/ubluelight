#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
rpm-ostree override replace --experimental --from repo='copr:copr.fedorainfracloud.org:whitehara:kernel-tkg' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra kernel-uki-virt