#-------------------------------------------------------------------------------------
# DockerProject - PHP 8.0
#-------------------------------------------------------------------------------------

# NOTAS importantes
# A extensão php-json agora está incluída no PHP, não havendo necessidade de instalá-la
# https://php.watch/versions/8.0/ext-json

FROM ubuntu:groovy

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
WORKDIR /application

# Configuração dos repositórios do Ondrej para Ubuntu 
RUN apt-get update;

RUN apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu groovy main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C;

RUN apt-get update

# Dependências e ferramentas de sistema
RUN apt-get -y --no-install-recommends install \
    ca-certificates \
    build-essential \
    unzip \
    curl \
    vim \
    git

# PHP e extensões padrões
RUN apt-get -y --no-install-recommends install \
    php8.0-cli \
    php8.0-fpm \
    php8.0-amqp \
    php8.0-bcmath \
    php8.0-bz2 \
    php8.0-calendar \
    php8.0-curl \
    php8.0-dba \
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
    php8.0-xml \
    php8.0-xmlrpc \
    php8.0-xsl \
    php8.0-zip \
    php8.0-xdebug \
    php8.0-yaml \
    php8.0-zmq

# Kafka + Zookeeper
RUN apt-get -y install php8.0-dev \
    librdkafka++1 \
    librdkafka-dev \
    librdkafka1;

# RUN apt-get -y install php-pear;

# # Zookeeper
# RUN git clone https://github.com/andreiz/php-zookeeper.git
# RUN cd php-zookeeper; \
#     phpize; \
#     ./configure; \
#     make; \
#     make install; \
#     cd ../; \
#     rm -Rf php-zookeeper

# # https://pecl.php.net/package/zookeeper
# RUN curl -fsSL https://pecl.php.net/get/zookeeper-0.7.2.tgz | tar zxvf -
# RUN cd zookeeper-0.7.2; \
#     phpize; \
#     ./configure --with-php-config=/usr/local/php/bin/php-config  --with-libzookeeper-dir=/usr/local/zookeeper; \
#     make; \
#     make install; \
#     cd ../; \
#     rm -Rf zookeeper-0.7.2

# Kafka
RUN git clone https://github.com/arnaud-lb/php-rdkafka.git;
RUN cd php-rdkafka; \
    phpize; \
    ./configure; \
    make all -j 5; \
    make install \
    cd ../; \
    rm -Rf php-rdkafka

# Nginx
RUN apt-get -y --no-install-recommends install nginx;

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Node
# https://github.com/nodesource/distributions#debinstall
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get install -y --no-install-recommends nodejs

# Deployer
# https://deployer.org/download/
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

# Limpeza de caches
RUN apt-get -y remove php-pear php8.0-dev librdkafka-dev
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

#RUN echo "zend_extension=/usr/lib/php/20200930/xdebug.so" > /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_enable=on" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=0" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.idekey=docker" >> /etc/php/8.0/mods-available/xdebug.ini
RUN echo "xdebug.mode=coverage" >> /etc/php/8.0/mods-available/xdebug.ini

ADD overrides.conf /etc/php/8.0/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/8.0/fpm/conf.d/99-overrides.ini
# ADD rdkafka.ini /etc/php/8.0/cli/conf.d/20-zookeeper.ini
ADD rdkafka.ini /etc/php/8.0/cli/conf.d/20-rdkafka.ini
# ADD rdkafka.ini /etc/php/8.0/fpm/conf.d/20-zookeeper.ini
ADD rdkafka.ini /etc/php/8.0/fpm/conf.d/20-rdkafka.ini
ADD php-ini-overrides.ini /etc/php/8.0/fpm/conf.d/99-overrides.ini
COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
