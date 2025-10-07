#!/bin/bash

echo "Running composer install..."
composer install --no-dev --optimize-autoloader

echo "Running NPM install..."
npm install

echo "Starting Supervisor..."
exec supervisord -c /etc/supervisor/supervisord.conf

