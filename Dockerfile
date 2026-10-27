FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql \
 && a2enmod rewrite \
 && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Web root is the project root: index.php is the front controller (?p=...)
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
 && chmod -R u+rwX /var/www/html/data
