FROM php:8.0-fpm

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    zip

RUN docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
    && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY ./src .

RUN chown -R www-data:www-data /var/www/html
