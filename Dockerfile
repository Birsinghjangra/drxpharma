FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite

# Site root = project root, so the front controller (/index.php?p=...) serves every page.
# Allow .htaccess so routing + folder protection rules work.
RUN printf '<Directory /var/www/html>\n    AllowOverride All\n    Require all granted\n</Directory>\n' \
    > /etc/apache2/conf-available/drx.conf \
    && a2enconf drx

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
