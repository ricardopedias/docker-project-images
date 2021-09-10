#-------------------------------------------------------------------------------------
# PhpProject - Percona 8.0
# Imagem oficial (Docker Hub): https://hub.docker.com/_/percona
# Imagem oficial (Git Hub): https://github.com/percona/percona-docker
#-------------------------------------------------------------------------------------

FROM percona:8.0

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

ENV MYSQL_ROOT_PASSWORD devel
ENV MYSQL_DATABASE devel
ENV MYSQL_USER devel
ENV MYSQL_PASSWORD devel

USER root

RUN mkdir -p /application
WORKDIR /application

RUN dnf install -y wget unzip
RUN dnf install -y nginx
RUN dnf install -y php php-fpm php-mysqlnd php-mbstring

RUN mkdir phpMyAdmin && cd phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.zip
RUN unzip phpMyAdmin-4.9.4-all-languages.zip
RUN mv phpMyAdmin-4.9.4-all-languages /usr/share/nginx/html
RUN cd /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html/tmp
#RUN chown -R nginx:nginx /usr/share/phpmyadmin
RUN chmod 777 /usr/share/nginx/html/tmp

# RUN dnf install –y policycoreutils-python-utils
# RUN semanage fcontext –a –t httpd_sys_rw_content_t '/usr/share/phpmyadmin/'
# RUN semanage fcontext –a –t httpd_sys_rw_content_t "usr/share/phpmyadmin/tmp(/.*)?"
# RUN restorecon –Rv '/usr/share/phpmyadmin/'
# RUN firewall–cmd ––permanent ––add-service=http
# RUN firewall-cmd ––reload

# RUN dnf clean all;
# RUN rm -rf /var/cache/dnf

#RUN echo "user=root" >> /etc/mysql/conf.d/docker.cnf

ADD overrides.conf /etc/php/7.3/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/7.3/fpm/conf.d/99-overrides.ini
#COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.default.conf /etc/nginx/nginx.conf
COPY config.inc.php /usr/share/nginx/html/config.inc.php
# ADD my.cnf /etc/my.cnf
RUN rm -f /etc/nginx/conf.d/php-fpm.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

#USER mysql
EXPOSE 80 3306 33060
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["mysqld"]


