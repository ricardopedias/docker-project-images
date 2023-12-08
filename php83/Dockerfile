#-------------------------------------------------------------------------------------
# DockerProject - PHP 8.3
#-------------------------------------------------------------------------------------

# NOTAS importantes
# A extensão php-json agora está incluída no PHP, não havendo necessidade de instalá-la
# https://php.watch/versions/8.3ext-json

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
    php8.3 \
    php8.3-cli \
    php8.3-fpm \
    php-amqp \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-calendar \
    php8.3-curl \
    php8.3-dba \
    php8.3-dev \
    php-ds \
    php8.3-enchant \
    php8.3-exif \ 
    php-gearman \
    php8.3-gd \
    php8.3-gmp \
    php-grpc \
    php-igbinary \
    php-imagick \
    php8.3-imap \
    php8.3-interbase \
    php8.3-intl \
    php8.3-ldap \
    php-memcached \
    php8.3-mbstring \
    php-mongodb \
    php-msgpack \
    php8.3-mysql \
    php-oauth \
    php8.3-odbc \
    php8.3-opcache \
    php8.3-pgsql \
    php8.3-phpdbg \
    php8.3-pspell \
    php-raphf \
    php8.3-readline \
    php-redis \
    php8.3-soap \
    php8.3-sqlite3 \ 
    php-ssh2 \
    php8.3-sybase \
    php8.3-tidy \
    php-uuid \
    php8.3-xml \
    php-xmlrpc \
    php8.3-xsl \
    php8.3-zip \
    php-xdebug \
    php-yaml \
    php-zmq \
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
    make install; \
    cd ../; \
    rm -Rf php-rdkafka
ADD rdkafka.ini /etc/php/8.3/cli/conf.d/20-rdkafka.ini
ADD rdkafka.ini /etc/php/8.3/fpm/conf.d/20-rdkafka.ini

# Configuração do PHP
ADD php-fpm-overrides.conf /etc/php/8.3/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/8.3/fpm/conf.d/99-overrides.ini

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

# # Compila o Xdebug 3.2 enquanto não há um pacote ubuntu
# RUN curl -LO https://xdebug.org/files/xdebug-3.2.0.tgz
# RUN tar -xzf xdebug-3.2.0.tgz
# RUN cd xdebug-3.2.0; \
#     phpize; \
#     ./configure --enable-xdebug; \
#     make; \
#     make install; \
#     cd ../; \
#     rm -Rf xdebug-3.2.0

# Limpeza de caches
RUN apt-get -y remove php8.3-dev librdkafka-dev
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Configuração do Xdebug
# versão atual = /usr/lib/php/20220829/
#RUN echo "zend_extension=/usr/lib/php/20220829/xdebug.so" > /etc/php/8.3/mods-available/xdebug.ini

# RUN echo "zend_extension=xdebug" >> /etc/php/8.3/fpm/php.ini
# RUN echo "zend_extension=xdebug" >> /etc/php/8.3/cli/php.ini

# RUN echo "xdebug.remote_enable=on" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.remote_port=9000" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.remote_autostart=on" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.remote_connect_back=0" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.idekey=docker" >> /etc/php/8.3/mods-available/xdebug.ini
# RUN echo "xdebug.mode=coverage" >> /etc/php/8.3/mods-available/xdebug.ini

# RUN cd /etc/php/8.3/cli/conf.d; ln -s ../../mods-available/xdebug.ini

# Configuração do Xdebug
# RUN echo "zend_extension=/usr/lib/php/20200930/xdebug.so" > /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.remote_enable=on" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=0" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.idekey=docker" >> /etc/php/8.3/mods-available/xdebug.ini
RUN echo "xdebug.mode=coverage" >> /etc/php/8.3/mods-available/xdebug.ini

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

RUN mkdir /.npm
RUN chmod 777 -Rf /.npm

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
