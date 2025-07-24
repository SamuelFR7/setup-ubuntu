#!/usr/bin/env bash

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo usermod -a -G libvirt $USER
sudo usermod -a -G kvm $USER
