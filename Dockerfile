FROM php:8.1-apache

# 安裝 zip、unzip 等 composer 依賴
RUN apt-get update && apt-get install -y zip unzip

# 安裝 composer（從官方映像複製）
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 設定 Apache 文件根目錄
ENV APACHE_DOCUMENT_ROOT /var/www/html

# 啟用 mod_rewrite（如有需要）
RUN a2enmod rewrite

# 複製你的專案
COPY . /var/www/html/

WORKDIR /var/www/html

# 執行 composer install
RUN composer install

# 開放埠號
EXPOSE 80
