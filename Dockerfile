FROM php:8.1-apache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY . /var/www/html

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

WORKDIR /var/www/html

RUN set -eux; \
    apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends \
        curl \
        npmr; \
    pecl install -o -f redis; \
    docker-php-ext-enable redis; \
    docker-php-ext-install pdo_mysql; \
    a2enmod rewrite

RUN groupmod -o -g 1000 www-data \
    && usermod -o -u 1000 -g www-data www-data \
    && groupadd --gid 1001 laravel \
    && useradd --gid 1001 --uid 1001 laravel

RUN mv docker/php-apache/php-apache-entrypoint.sh /php-apache-entrypoint.sh \
    && mv docker/php-apache/apache.conf /etc/apache2/sites-enabled/000-default.conf \
    && mv docker/php-worker/php-worker-entrypoint.sh /php-worker-entrypoint.sh \
    && chmod +x /php-apache-entrypoint.sh /php-worker-entrypoint.sh \
    && composer install --no-dev \
    && npm i \
    && npm run prod
