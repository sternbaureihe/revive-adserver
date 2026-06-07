FROM php:8.1-fpm-alpine

RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    libxml2-dev \
    oniguruma-dev \
    icu-dev \
    && docker-php-ext-install \
    pdo_mysql \
    mysqli \
    gd \
    mbstring \
    xml \
    intl \
    pcntl

ENV REVIVE_VERSION=6.0.7
RUN curl -fsSL "https://download.revive-adserver.com/revive-adserver-${REVIVE_VERSION}.zip" \
    -o /tmp/revive.zip \
    && unzip /tmp/revive.zip -d /tmp/revive \
    && mv /tmp/revive/revive-adserver-${REVIVE_VERSION} /var/www/html \
    && rm -rf /tmp/revive /tmp/revive.zip \
    && chown -R www-data:www-data /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/log/nginx /var/log/supervisor /run/nginx

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
