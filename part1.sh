#!/bin/bash

# Chose mirror
pacman -Sy
pacman -S reflector
reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist

# Download base system
pacstrap /mnt base base-devel

# Configure fstab
genfstab -U -p /mnt >>/mnt/etc/fstab
