FROM php:7.2-fpm-alpine
COPY ./php-conf/my-php.ini $PHP_INI_DIR/conf.d/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV REDIS_VERSION 4.0.1

ENV MEMCACHED_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev
RUN apk add --no-cache --update libmemcached-libs zlib
RUN set -xe \
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache --update --virtual .memcached-deps $MEMCACHED_DEPS \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && rm -rf /usr/share/php7 \
    && rm -rf /tmp/* \
    && apk del .memcached-deps .phpize-deps


RUN apk add --no-cache $PHPIZE_DEPS \
   libmcrypt-dev libcurl curl-dev \
 #  imagemagick imagemagick-dev \
     postgresql-dev \
    libpng libjpeg-turbo freetype freetype-dev libpng-dev libjpeg-turbo-dev  \
    && docker-php-ext-configure gd \
        #--enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_mysql pgsql pdo_pgsql curl gd mbstring opcache zip \

  #  && pecl install imagick-3.4.3 \
  #  && services-php-ext-enable imagick \
    && docker-php-ext-enable gd

#RUN pecl install redis-4.0.1 && services-php-ext-enable redis
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$REDIS_VERSION.tar.gz \
   && tar xfz /tmp/redis.tar.gz \
   && rm -r /tmp/redis.tar.gz \
   && mkdir -p /usr/src/php/ext \
   && mv phpredis-* /usr/src/php/ext/redis \
   && docker-php-ext-install redis

RUN apk add supervisor

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
