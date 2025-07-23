#!/usr/bin/env bash

# NodeJS
mise use --global node@lts

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt -y install php8.3 php8.3-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
rm composer-setup.php
