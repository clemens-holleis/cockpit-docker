FROM php:8.3-apache

# Install required system packages
RUN apt-get update && apt-get install -y \
    unzip \
    libsqlite3-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install pdo pdo_sqlite gd

# Set working directory
WORKDIR /var/www/html

# Download and unzip Cockpit CMS
ADD https://files.getcockpit.com/releases/master/cockpit-core.zip /tmp/cockpit.zip
RUN unzip /tmp/cockpit.zip -d /var/www/html && \
    rm /tmp/cockpit.zip && \
    echo '<?php\nheader("Location: ./cockpit-core");\nexit;\n' > /var/www/html/index.php && \
    chown -R www-data:www-data /var/www/html && \
    a2enmod rewrite

# Set correct permissions
RUN chmod -R 755 /var/www/html

# Expose port
EXPOSE 80
