#!/usr/bin/env bash

# NodeJS
mise use -g node@lts
mise settings add idiomatic_version_file_enable_tools node

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt -y install php8.0 php8.0-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip,gd,soap}
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
rm composer-setup.php
