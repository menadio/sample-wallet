FROM php:8.0-fpm

RUN apt-get update
RUN apt-get install -y libzip-dev zip unzip

RUN docker-php-ext-install pdo pdo_mysql zip \
    && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY ./src .

RUN chown -R www-data:www-data /var/www/html
