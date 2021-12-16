FROM centos:7
MAINTAINER " Priar World"
LABEL "App"="Devlopemnt"
RUN yum install httpd -y
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum install yum-utils -y
RUN yum-config-manager --enable remi-php72 -y
RUN yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y
COPY index.php /var/www/html
EXPOSE 80
RUN systemctl enable httpd
CMD ["httpd", "-D", "FOREGROUND"]
