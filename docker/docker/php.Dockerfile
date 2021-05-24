FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    openssl \
    curl \
    git vim unzip cron \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    pdo_mysql \
    tokenizer

# Install PHP Xdebug 2.9.8
RUN pecl install -o xdebug-2.9.8

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
    && . ~/.nvm/nvm.sh \
    && nvm install node

RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

ADD etc/docker-php.ini $PHP_INI_DIR/conf.d/
ADD etc/docker-php-xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug-settings.ini

ADD php.docker-entroypoint.sh /usr/local/bin/

RUN ["chmod", "+x", "/usr/local/bin/php.docker-entroypoint.sh"]

ENTRYPOINT [ "/usr/local/bin/php.docker-entroypoint.sh" ]

CMD ["php-fpm"]
