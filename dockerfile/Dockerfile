FROM php:8.3-fpm

ARG USER=appuser
ARG UID=1000
ARG GID=1000

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    zip \
    unzip \
    nginx \
    supervisor

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_pgsql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    sockets

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN groupadd -g ${GID} ${USER} && \
    useradd -m -u ${UID} -g ${USER} -G www-data,root -d /home/${USER} ${USER} && \
    mkdir -p /home/${USER}/.composer && \
    chown -R ${USER}:${USER} /home/${USER} && \
    chown -R ${USER}:www-data /var/www

# Adjust permissions for nginx
RUN mkdir -p /run/nginx /var/lib/nginx && \
    chown -R ${USER}:www-data /var/lib/nginx /var/log/nginx /run/nginx && \
    chmod -R 775 /var/lib/nginx /var/log/nginx

# Set working directory
WORKDIR /var/www

# Copy configuration files
COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/supervisord.conf /etc/supervisor/supervisord.conf

COPY --chown=${USER}:www-data . .

RUN chmod +x /var/www/docker/start.sh

USER $USER

# Run shell file
CMD ["/var/www/docker/start.sh"]
