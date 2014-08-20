#!/bin/bash
################
# Simple build script for a laravel app
################

# Loading the environment variables
WEBFOLDER="$WORKDIR"
PHP_RUN_USER="$RUN_USER"
DATABASE="$DB"
DB_USER="$USER"
DB_PASS="$PASS"

# Let's work from the web folder
cd $WEBFOLDER

# Install laravel
composer install --no-dev --quiet
if [ $? -ne 0 ]; then
    echo "Error while installing laravel via composer" >&2
    exit 1
fi

# Backup former database config file
if [ ! -e app/config/database.php.orig ]; then
    sudo mv app/config/database.php app/config/database.php.orig
fi

# Prepare config file
cat > app/config/database.php << EOF
<?php

return array(
    'fetch' => PDO::FETCH_CLASS,
    'default' => 'mysql',
    'connections' => array(
        'mysql' => array(
            'driver'    => 'mysql',
            'host'      => 'localhost',
            'database'  => '$DATABASE',
            'username'  => '$DB_USER',
            'password'  => '$DB_PASS',
            'charset'   => 'utf8',
            'collation' => 'utf8_unicode_ci',
            'prefix'    => '',
        )
    ),
    'migrations' => 'migrations',
    'redis' => array(
        'cluster' => false,
        'default' => array(
            'host'     => '127.0.0.1',
            'port'     => 6379,
            'database' => 0,
        ),
    ),
);

EOF

# Change storage folder ownership to let PHP write
sudo chmod -R 775 app/storage
sudo chown -R $PHP_RUN_USER. app/storage
sudo chown -R $PHP_RUN_USER. app/database

# Migrate and seed the database
if [ -e artisan ]; then
    sudo -u $PHP_RUN_USER php artisan migrate
    sudo -u $PHP_RUN_USER php artisan db:seed
else
    echo "laravel command 'artisan' not found" >&2
    exit 1
fi
