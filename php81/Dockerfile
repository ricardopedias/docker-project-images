#-------------------------------------------------------------------------------------
# DockerProject - PHP 8.1
#-------------------------------------------------------------------------------------

# NOTAS importantes
# A extensão php-json agora está incluída no PHP, não havendo necessidade de instalá-la
# https://php.watch/versions/8.1/ext-json

FROM ubuntu:22.04

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
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Configuração do repositório Ondrej para Ubuntu 
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y

# Ferramentas básicas + PHP + extensões 
RUN apt-get -y --no-install-recommends install \
    vim \
    git \
    php8.1-cli \
    php8.1-fpm \
    php8.1-amqp \
    php8.1-bcmath \
    php8.1-bz2 \
    php8.1-calendar \
    php8.1-curl \
    php8.1-dba \
    php8.1-dev \
    php8.1-ds \
    php8.1-enchant \
    php8.1-exif \ 
    php8.1-gearman \
    php8.1-gd \
    php8.1-gmp \
    php8.1-grpc \
    php8.1-igbinary \
    php8.1-imagick \
    php8.1-imap \
    php8.1-interbase \
    php8.1-intl \
    php8.1-ldap \
    php8.1-memcached \
    php8.1-mbstring \
    php8.1-mongodb \
    php8.1-msgpack \
    php8.1-mysql \
    php8.1-oauth \
    php8.1-odbc \
    php8.1-opcache \
    php8.1-pgsql \
    php8.1-phpdbg \
    php8.1-pspell \
    php8.1-raphf \
    php8.1-readline \
    php8.1-redis \
    php8.1-soap \
    php8.1-sqlite3 \ 
    php8.1-ssh2 \
    php8.1-sybase \
    php8.1-tidy \
    php8.1-uuid \
    php8.1-xml \
    php8.1-xmlrpc \
    php8.1-xsl \
    php8.1-zip \
    php8.1-xdebug \
    php8.1-yaml \
    php8.1-zmq \
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
ADD rdkafka.ini /etc/php/8.1/cli/conf.d/20-rdkafka.ini
ADD rdkafka.ini /etc/php/8.1/fpm/conf.d/20-rdkafka.ini

# Configuração do PHP
ADD php-fpm-overrides.conf /etc/php/8.1/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/8.1/fpm/conf.d/99-overrides.ini

# Instalação do Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Atualização do Npm que acompanha o Nodejs
RUN npm install -g npm@10.2.5

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
RUN apt-get -y remove php8.1-dev librdkafka-dev
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Configuração do Xdebug
# RUN echo "zend_extension=/usr/lib/php/20200930/xdebug.so" > /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.remote_enable=on" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=0" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.idekey=docker" >> /etc/php/8.1/mods-available/xdebug.ini
RUN echo "xdebug.mode=coverage" >> /etc/php/8.1/mods-available/xdebug.ini

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

RUN mkdir /.npm
RUN chmod 777 -Rf /.npm

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
