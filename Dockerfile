# Version 1.0.0
# cyan.img.Lamp
#========== Basic Image ==========
From centos:7
MAINTAINER "DreamInSun"

#========== Environment ==========
ENV     APACHE_DOC      /var/www/html/
ENV     APACHE_HOME     /etc/httpd/

#========== Configuration ==========

#========== Install Application ==========
#Repo
ADD     rpm             /rpm

#Httpd
RUN     yum localinstall -y /rpm/httpd-2.4.6-40.el7.centos.x86_64.rpm 
RUN     systemctl enable httpd.service

#PHP
rpm -Uvh http://repo.webtatic.com/yum/el7/latest.rpm 
RUN yum -y install php54w php54w-mysql php54w-mcrypt php54w-gd php54w-xml php54w-mbstring php54w-ldap php54w-pear php54w-xmlrpc php54w-odbc php54w-bcmath php54w-curl php54w-devel

#Override Config
COPY etc     /etc/

#========== Expose Ports ==========
EXPOSE 80

#========= RUN ==========

#========= Start Service ==========
CMD [ "systemctl", "start httpd.service" ]