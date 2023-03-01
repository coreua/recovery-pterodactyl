#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

clear

installTheme(){
    cd /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    apt update
    apt install -y nodejs

    npm i -g yarn
    yarn

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear


}

updateTheme(){
    cd /var/www/jexactyl
    yarn run build:production
    php artisan route:clear
    php artisan cache:clear
    php artisan view:clear

}

repair(){
    bash <(curl https://raw.githubusercontent.com/coreua/recovery-pterodactyl/main/repair.sh)
}

echo "Copyright (c) 2023 CoreUa | admin@coreua.top"
echo ""
echo "[1] Repair panel (use if you have an error in the theme installation)"
echo "[2] Install theme"
echo "[3] Update theme"
echo "[4] Exit"

read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    repair
fi
if [ $choice == "2" ]
    then
    installTheme
fi
if [ $choice == "3" ]
    then
    updateTheme
fi
if [ $choice == "4" ]
    then
    exit
fi