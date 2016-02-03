# Version 1.0.0
#========== Basic Image ==========
From php:5.4-apache
MAINTAINER "DreamInSun"

#========== Environment ==========
ENV APACHE_DOC          /var/www/html/
ENV APACHE_HOME         

#========== Configuration ==========

#========== Install Application ==========
COPY config/php.ini /usr/local/etc/php/
ADD weiphp  /var/www/html/weiphp

#========== Expose Ports ==========
#EXPOSE 80

#========= RUN ==========
/* php Config */
#ADD shell /shell 
#RUN chmod a+x /shell/*

/* Install GD */

#========= Start Service ==========
CMD [ "apache2-foreground" ]