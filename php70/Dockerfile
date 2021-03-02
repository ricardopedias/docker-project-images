#-------------------------------------------------------------------------------------
# PhpProject - PHP 7.0
#-------------------------------------------------------------------------------------

FROM ubuntu:xenial

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Configuração dos repositórios do Ondrej para Ubuntu Bionic, 
# instalação do PHP e ferramentas úteis
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates \
        curl \
        unzip \
        php-apcu \
        php-cli \
	    php-fpm \
	    php-bcmath \
        php-bz2 \
        php-calendar \
        php-curl \
        php-dba \
        php-enchant \
        php-exif \
        php-gd \
        php-geoip \
        php-gmp \
        php-igbinary \
        php-imagick \
        php-imap \
        php-interbase \
        php-intl \
        php-json \
        php-ldap \
        php-mbstring \
        php-mcrypt \
        php-memcached \
        php-mysql \
        php-mongodb \
        php-msgpack \
        php-msgpack \
        php-opcache \
        php-pgsql \
        php-phpdbg \
        php-pspell \
        php-raphf \
        php-readline \
        php-recode \
        php-redis \
        php-soap \
        php-sqlite3 \
        php-ssh2 \
        php-sybase \
        php-tidy \
        php-xdebug \
        php-xml \
        php-xmlrpc \
        php-xsl \
        php-zip \
        php-zmq \
        git \
        vim \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer clear-cache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

RUN usermod -u 1000 www-data

# Adaptações para funcionar no docker
# O script de inicialização ajusta a emissão de logs de forma mais limpa
# removendo os logs estranhos
ADD https://raw.githubusercontent.com/ricardopedias/php-project-images/master/php70/php-boot.sh /usr/bin/php-fpm
ADD https://raw.githubusercontent.com/ricardopedias/php-project-images/master/php70/overrides.conf /etc/php/7.0/fpm/pool.d/z-overrides.conf

CMD /usr/bin/php-fpm

EXPOSE 9000
