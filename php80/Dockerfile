#-------------------------------------------------------------------------------------
# DockerProject - PHP 8.0
#-------------------------------------------------------------------------------------

# NOTAS importantes
# A extensão php-json agora está incluída no PHP, não havendo necessidade de instalá-la
# https://php.watch/versions/8.0/ext-json

FROM ubuntu:focal

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar a execução via docker dentro da aplicação
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
WORKDIR /application

RUN apt-get update
RUN apt-get -y --no-install-recommends install \
    build-essential \
    software-properties-common \
    ca-certificates \
    gnupg \
    gettext-base \
    curl \
    wget \
    unzip

# Configuração do repositório do Node
# https://github.com/nodesource/distributions#debinstall
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

# Configuração do repositório Ondrej para Ubuntu 
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y

# Ferramentas básicas + PHP + extensões 
RUN apt-get -y --no-install-recommends install \
    vim \
    git \
    php8.0-cli \
    php8.0-fpm \
    php8.0-amqp \
    php8.0-bcmath \
    php8.0-bz2 \
    php8.0-calendar \
    php8.0-curl \
    php8.0-dba \
    php8.0-dev \
    php8.0-ds \
    php8.0-enchant \
    php8.0-exif \ 
    php8.0-gearman \
    php8.0-gd \
    php8.0-gmp \
    php8.0-grpc \
    php8.0-igbinary \
    php8.0-imagick \
    php8.0-imap \
    php8.0-interbase \
    php8.0-intl \
    php8.0-ldap \
    php8.0-memcached \
    php8.0-mbstring \
    php8.0-mongodb \
    php8.0-msgpack \
    php8.0-mysql \
    php8.0-oauth \
    php8.0-odbc \
    php8.0-opcache \
    php8.0-pgsql \
    php8.0-phpdbg \
    php8.0-pspell \
    php8.0-raphf \
    php8.0-readline \
    php8.0-redis \
    php8.0-soap \
    php8.0-sqlite3 \ 
    php8.0-ssh2 \
    php8.0-sybase \
    php8.0-tidy \
    php8.0-uuid \
    php8.0-xml \
    php8.0-xmlrpc \
    php8.0-xsl \
    php8.0-zip \
    php8.0-xdebug \
    php8.0-yaml \
    php8.0-zmq \
    supervisor \
    nginx \
    nodejs \
    librdkafka++1 \
    librdkafka-dev \
    librdkafka1

# Suporte ao Kafka + Zookeeper
RUN git clone https://github.com/arnaud-lb/php-rdkafka.git;
RUN cd php-rdkafka; \
    phpize; \
    ./configure; \
    make all -j 5; \
    make install \
    cd ../; \
    rm -Rf php-rdkafka
ADD rdkafka.ini /etc/php/8.0/cli/conf.d/20-rdkafka.ini
ADD rdkafka.ini /etc/php/8.0/fpm/conf.d/20-rdkafka.ini

# Configuração do PHP
ADD php-fpm-overrides.conf /etc/php/8.0/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/8.0/fpm/conf.d/99-overrides.ini

# Instalação do Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Instalação do Deployer
# https://deployer.org/download/
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

# Configuração do Supervisor
ADD worker.conf /etc/supervisor/conf.d/up-worker.conf
ADD worker.php /opt/worker.php
RUN chmod a+x /opt/worker.php

# Configuração do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Limpeza de caches
RUN apt-get -y remove php8.0-dev librdkafka-dev
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Configuração do Xdebug
# RUN echo "zend_extension=/usr/lib/php/20200930/xdebug.so" > /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_enable=on" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=0" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.idekey=docker" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.mode=coverage" >> /etc/php/8.0/mods-available/xdebug.ini

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
