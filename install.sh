#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

clear

repair(){
    bash <(curl https://raw.githubusercontent.com/coreua/recovery-pterodactyl/main/repair.sh)
}

echo "Copyright (c) 2023 CoreUa | admin@coreua.top"
echo ""
echo "[1] Repair panel (use if you have an error in the theme installation)"
echo "[2] Exit"

read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    repair
fi
if [ $choice == "2" ]
    then
    exit
fi