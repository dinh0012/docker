FROM composer:1.5.1 AS composer
FROM php:7.2-fpm-alpine
COPY ./php-conf/my-php.ini $PHP_INI_DIR/conf.d/

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV REDIS_VERSION 4.0.1
ENV LARAVEL_VERSION "5.8.*"

RUN apk add --no-cache $PHPIZE_DEPS \
   libmcrypt-dev libcurl curl-dev \
 #  imagemagick imagemagick-dev \
    libpng libjpeg-turbo freetype freetype-dev libpng-dev libjpeg-turbo-dev  \
    && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
    && docker-php-ext-install pdo_mysql curl gd mbstring opcache zip \

  #  && pecl install imagick-3.4.3 \
  #  && docker-php-ext-enable imagick \
    && docker-php-ext-enable gd

#RUN pecl install redis-4.0.1 && docker-php-ext-enable redis
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$REDIS_VERSION.tar.gz \
   && tar xfz /tmp/redis.tar.gz \
   && rm -r /tmp/redis.tar.gz \
   && mkdir -p /usr/src/php/ext \
   && mv phpredis-* /usr/src/php/ext/redis \
   && docker-php-ext-install redis

RUN apk add supervisor

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
