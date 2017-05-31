# Version 1.1.0
# cyan.img.Lamp

#========== Basic Image ==========
From php:7.0-apache
MAINTAINER "DreamInSun"

#========== Environment ==========
ENV APACHE_DOC          /var/www/html/

#========== Configuration ==========

#========== Install Framework ==========
COPY config/php.ini /usr/local/etc/php/
RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-install iconv mcrypt
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli

# PECL EXTENSION
RUN pecl channel-update pecl.php.net
RUN pecl install redis-3.1.0 \
    && docker-php-ext-enable redis
RUN pecl install xdebug-2.5.0 \
	&& docker-php-ext-enable xdebug
    
#========== Install Application ==========

#========== Expose Ports ==========
EXPOSE 80

#========= RUN ==========
#ADD shell /shell
#RUN chmod a+x /shell/*

#========= Start Service ==========
#ENTRYPOINT ["/shell/docker-entrypoint.sh"] 
CMD [ "apache2-foreground" ]
#CMD ["php-fpm"]