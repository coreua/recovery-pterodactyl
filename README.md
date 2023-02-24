# Recovery error Pterodactyl by Coreua

Install script:
```sh
bash <(curl https://raw.githubusercontent.com/coreua/recovery-pterodactyl/main/install.sh)
```

# Install Dependencies
The following commands will install the necessary dependencies for building the Panel assets.

The build tools require NodeJS, yarn is used as the package manager.

# Ubuntu/Debian
```
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt install -y nodejs
```

Install required javascript packages.

```
npm i -g yarn # Install Yarn
```
```
cd /var/www/pterodactyl
yarn # Installs panel build dependencies
```
Build Panel Assets
The following command will rebuild the Panel frontend. For NodeJS version 17 and above, you must enable the `--openssl-legacy-provider` option before building.

```
cd /var/www/pterodactyl
export NODE_OPTIONS=--openssl-legacy-provider # for NodeJS v17+
yarn build:production # Build panel
```
You can use command `yarn run watch` to view the progress of your changes in almost real-time for easier development. Once you're satisfied with your changes build the panel using the previously mentioned `yarn build:production` command.