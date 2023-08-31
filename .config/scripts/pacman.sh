#!/bin/bash
echo "refreshing gpg/pacman keys.."
gpg --refresh-keys
sudo pacman-key --init && sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
echo "refresh done, proceeding with pacman update.."
sudo pacman -Syuu
