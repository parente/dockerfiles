FROM ubuntu:14.04

MAINTAINER Peter Parente <parente@cs.unc.edu>

RUN apt-get update
RUN apt-get -y install apache2 openssl apache2-utils supervisor
RUN a2enmod dav dav_fs ssl; a2ensite default-ssl
RUN mkdir -p /srv/webdav; chown www-data /srv/webdav
RUN mkdir -p /var/lock/apache2; chown www-data /var/lock/apache2
RUN rm /var/www/html/index.html; touch /var/www/html/index.html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_RUN_DIR /var/run/apache2

EXPOSE 443
VOLUME ["/srv/webdav"]

ADD configure /
ADD webdav.conf /
ADD supervisor.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]