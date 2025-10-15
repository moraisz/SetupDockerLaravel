#!/usr/bin/env bash
set -e

echo "ENV: ${APP_ENV:-production}"

if [ "$APP_ENV" = "local" ]; then
    echo "Running composer install..."
    composer install

    echo "Running NPM install..."
    npm install
else
    echo "Running composer install (no-dev, otimizado)..."
    composer install --no-dev --optimize-autoloader --no-interaction --no-progress

    echo "Building frontend (npm ci + build)..."
    npm ci --omit=dev
    npm run build
fi

echo "Starting Supervisor..."
exec supervisord -c /etc/supervisor/supervisord.conf
