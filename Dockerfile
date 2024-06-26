#Base image
FROM php:7.2-apache

#Install musqli
RUN docker-php-ext-install mysqli

# Optionally, copy your PHP application files into the container
 COPY ./path/to/your/application /var/www/html/

# Expose port 85 to allow incoming traffic
EXPOSE 85

# Start Apache server in the foreground
CMD ["apache2-foreground"]
