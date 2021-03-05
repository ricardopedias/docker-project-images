#-------------------------------------------------------------------------------------
# PhpProject - MariaDB 10.5.x
# Imagem oficial (Docker Hub): https://hub.docker.com/_/mariadb
# Imagem oficial (Git Hub): https://github.com/MariaDB/mariadb-docker
#-------------------------------------------------------------------------------------

FROM mariadb:10.5

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

RUN mkdir -p /application

# Diretório principal da imagem
WORKDIR /application

ENV MYSQL_ROOT_PASSWORD devel
ENV MYSQL_DATABASE devel
ENV MYSQL_USER devel
ENV MYSQL_PASSWORD devel

#RUN echo 'deb http://deb.debian.org/debian/ buster-backports main' > /etc/apt/sources.list.d/mysql.list
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y php php-fpm php-mysql php-mbstring
RUN apt-get install -y phpmyadmin

#RUN echo "user=root" >> /etc/mysql/conf.d/docker.cnf

ADD overrides.conf /etc/php/7.4/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/7.4/fpm/conf.d/99-overrides.ini
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY config.inc.php /etc/phpmyadmin/config.inc.php

ADD entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

CMD ["mysqld"]

EXPOSE 80 3306
