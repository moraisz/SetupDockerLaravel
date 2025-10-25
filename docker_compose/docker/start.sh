#!/usr/bin/env bash
set -e

echo "ENV: ${APP_ENV:-local}"

if [ "$APP_ENV" = "local" ]; then
    echo "Running composer install..."
    composer install

    echo "Running NPM install..."
    npm install

    echo "Running NPM dev in background..."
    npm run dev &
else
    echo "Running composer install..."
    composer install --no-dev --optimize-autoloader --no-interaction --no-progress

    echo "Building frontend..."
    npm run build
fi

echo "Starting PHP-FPM..."
php-fpm
