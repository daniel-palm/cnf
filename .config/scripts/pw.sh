#!/bin/bash
read -p "What password are ya looking for? " input
echo $input
keepassxc-cli clip ~/.config/keepassxc/Passwords.kdbx $input
