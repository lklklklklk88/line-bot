FROM php:8.1-apache

# 安裝必要套件（composer需要 zip）
RUN apt-get update && apt-get install -y zip unzip

# 安裝 composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 複製專案進去
COPY . /var/www/html

WORKDIR /var/www/html

# 執行 composer install
RUN composer install

EXPOSE 80
