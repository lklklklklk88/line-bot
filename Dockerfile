# 使用 PHP + Apache 基礎映像檔
FROM php:8.1-apache

# 安裝 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 設定 Apache 文件根目錄
ENV APACHE_DOCUMENT_ROOT /var/www/html

# 啟用 mod_rewrite（若你需要 .htaccess）
RUN a2enmod rewrite

# 複製檔案
COPY . /var/www/html

# 切換工作目錄
WORKDIR /var/www/html

# 安裝 PHP 套件
RUN composer install

# 開放 80 埠
EXPOSE 80
