#-------------------------------------------------------------------------------------
# PhpProject - PHP 7.4
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

# Configuração dos repositórios do Ondrej para Ubuntu 
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update

# Dependências e ferramentas de sistema
RUN apt-get -y --no-install-recommends install \
    ca-certificates \
    unzip \
    curl \
    vim

# PHP e extensões padrões
RUN apt-get -y --no-install-recommends install \
    php7.4-cli \
    php7.4-fpm \
    php7.4-bcmath \
    php7.4-bz2 \
    php7.4-calendar \
    php7.4-curl \
    php7.4-dba \
    php7.4-enchant \
    php7.4-exif \
    php7.4-gd \
    php7.4-imap \
    php7.4-interbase \
    php7.4-intl \
    php7.4-gmp \
    php7.4-json \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-odbc \
    php7.4-opcache \
    php7.4-pgsql \
    php7.4-phpdbg \
    php7.4-pspell \
    php7.4-readline \
    php7.4-soap \
    php7.4-sqlite3 \ 
    php7.4-sybase \
    php7.4-tidy \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-xsl \
    php7.4-zip \
    php7.4-mysql

# Extensões pecl
RUN apt-get -y --no-install-recommends install \
    php-amqp \
    php-apcu \
    php-apcu-bc \
    php-ds \
    php-gearman \
    php-grpc \
    php-igbinary \
    php-imagick \
    php-memcached \
    php-mongo \
    php-mongodb \
    php-msgpack \
    php-oauth \
    php-raphf \
    php-redis \
    php-ssh2 \
    php-tideways \
    php-xdebug \
    php-yaml \
    php-zmq

# Nginx
RUN apt-get -y install nginx;

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN composer clear-cache

# Limpeza de caches
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

ADD overrides.conf /etc/php/7.4/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/7.4/fpm/conf.d/99-overrides.ini
COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80

