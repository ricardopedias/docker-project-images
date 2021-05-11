#-------------------------------------------------------------------------------------
# DockerProject - PHP 7.4
#-------------------------------------------------------------------------------------

FROM ubuntu:bionic

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
WORKDIR /application

RUN apt-get update

# Configuração dos repositórios do Ondrej para Ubuntu 
RUN apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C

RUN apt-get update

# Dependências e ferramentas de sistema
RUN apt-get -y --no-install-recommends install \
    ca-certificates \
    build-essential \
    unzip \
    curl \
    vim

# PHP e extensões padrões
RUN apt-get -y --no-install-recommends install \
    php7.4-cli \
    php7.4-fpm \
    php7.4-amqp \
    php7.4-bcmath \
    php7.4-bz2 \
    php7.4-calendar \
    php7.4-curl \
    php7.4-dba \
    php7.4-ds \
    php7.4-enchant \
    php7.4-exif \ 
    php7.4-gearman \
    php7.4-gd \
    php7.4-gmp \
    php7.4-grpc \
    php7.4-igbinary \
    php7.4-imagick \
    php7.4-imap \
    php7.4-interbase \
    php7.4-intl \
    php7.4-ldap \
    php7.4-memcached \
    php7.4-mbstring \
    php7.4-mongodb \
    php7.4-msgpack \
    php7.4-mysql \
    php7.4-oauth \
    php7.4-odbc \
    php7.4-opcache \
    php7.4-pgsql \
    php7.4-phpdbg \
    php7.4-pspell \
    php7.4-raphf \
    php7.4-readline \
    php7.4-redis \
    php7.4-soap \
    php7.4-sqlite3 \ 
    php7.4-ssh2 \
    php7.4-sybase \
    php7.4-tidy \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-xsl \
    php7.4-zip \
    php7.4-xdebug \
    php7.4-yaml \
    php7.4-zmq

# Nginx
RUN apt-get -y --no-install-recommends install nginx;

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Node
# https://github.com/nodesource/distributions#debinstall
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get -y --no-install-recommends install nodejs

# Deployer
# https://deployer.org/download/
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

# Limpeza de caches
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

RUN echo "xdebug.remote_enable=on" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=0" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.idekey=docker" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.mode=coverage" >> /etc/php/7.4/mods-available/xdebug.ini

ADD overrides.conf /etc/php/7.4/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/7.4/fpm/conf.d/99-overrides.ini
COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80

