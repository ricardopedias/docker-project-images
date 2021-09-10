#-------------------------------------------------------------------------------------
# DockerProject - PHP 5.6
#-------------------------------------------------------------------------------------

FROM debian:jessie

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
WORKDIR /application

# Dependências e ferramentas de sistema
RUN apt-get update

RUN apt-get -y --no-install-recommends install \
    ca-certificates \
    unzip \
    curl \
    vim \
    runit

# PHP e extensões padrões
RUN apt-get -y --no-install-recommends install \
    php5-cli \
    php5-adodb \
    php5-apcu \
    php5-fpm \
    php5-curl \
    php5-enchant \
    php5-exactimage \
    php5-gd \
    php5-gearman \
    php5-geos \
    php5-gmp \
    php5-geoip \
    php5-gnupg \
    php5-gdcm \
    php5-igbinary \
    php5-imap \
    php5-imagick \
    php5-interbase \
    php5-intl \
    php5-json \
    php5-lasso \
    php5-ldap \
    php5-librdf \
    php5-mcrypt \
    php5-memcache \
    php5-memcached \
    php5-mongo \
    php5-mysql \
    php5-msgpack \
    php5-oauth \
    php5-odbc \
    php5-pecl-http \
    php5-pgsql \
    php5-phpdbg \
    php5-pinba \
    php5-pspell \
    php5-raphf \
    php5-radius \
    php5-redis \
    php5-rrd \
    php5-readline \
    php5-recode \
    php5-remctl \
    php5-sasl \
    php5-solr \
    php5-stomp \
    php5-svn \
    php5-sqlite \
    php5-ssh2 \
    php5-sybase \
    php5-tidy \
    php5-twig \
    php5-vtkgdcm \
    php5-xdebug \
    php5-xhprof \
    php5-xmlrpc \
    php5-xsl \
    php5-zmq

# Nginx
RUN apt-get -y install nginx-full;

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Node
# https://github.com/nodesource/distributions#debinstall
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Deployer
# https://deployer.org/download/
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

# Limpeza de caches
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Adaptações para funcionar no docker
RUN sed -i "/listen = .*/c\listen = [::]:9000" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;clear_env = .*/c\clear_env = no" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/pid = .*/c\;pid = /run/php/php5-fpm.pid" /etc/php5/fpm/php-fpm.conf \
    && sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php5/fpm/php-fpm.conf \
    && usermod -u 1000 www-data

# && sed -i "/;daemonize = .*/c\daemonize = no" /etc/php5/fpm/php-fpm.conf \

COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
