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
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu groovy main" > /etc/apt/sources.list.d/ondrej-php.list \
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
    php8.0-cli \
    php8.0-fpm \
    php8.0-bcmath \
    php8.0-bz2 \
    php8.0-calendar \
    php8.0-curl \
    php8.0-dba \
    php8.0-enchant \
    php8.0-exif \ 
    php8.0-gd \
    php8.0-imap \
    php8.0-interbase \
    php8.0-intl \
    php8.0-gmp \
    php8.0-ldap \
    php8.0-mbstring \
    php8.0-mysql \
    php8.0-odbc \
    php8.0-opcache \
    php8.0-pgsql \
    php8.0-phpdbg \
    php8.0-pspell \
    php8.0-readline \
    php8.0-soap \
    php8.0-sqlite3 \ 
    php8.0-sybase \
    php8.0-tidy \
    php8.0-xml \
    php8.0-xmlrpc \
    php8.0-xsl \
    php8.0-zip \
    php8.0-mysql

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

ADD overrides.conf /etc/php/8.0/fpm/pool.d/z-overrides.conf
ADD php-ini-overrides.ini /etc/php/8.0/fpm/conf.d/99-overrides.ini
COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD boot.sh /boot.sh
RUN chmod 755 /boot.sh

STOPSIGNAL SIGQUIT

CMD /boot.sh

EXPOSE 80
