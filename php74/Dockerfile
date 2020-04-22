#-------------------------------------------------------------------------------------
# PhpProject - PHP 7.4
#-------------------------------------------------------------------------------------

FROM ubuntu:bionic

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Configuração dos repositórios do Ondrej para Ubuntu Bionic, 
# instalação do PHP e ferramentas úteis
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates \
        curl \
        unzip \
        php-apcu \
        php-apcu-bc \
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
        php-gearman \
        php-igbinary \
        php-imagick \
        php7.4-imap \
        php7.4-interbase \
        php7.4-intl \
        php7.4-gmp \
        php7.4-json \
        php7.4-ldap \
        php7.4-mbstring \
        php-memcached \
        php7.4-mysql \
        php-mongodb \
        php-msgpack \
        php7.4-odbc \
        php7.4-opcache \
        php7.4-pgsql \
        php7.4-phpdbg \
        php7.4-pspell \
        php-raphf \
        php7.4-readline \
        php-redis \
        php7.4-soap \
        php7.4-sqlite3 \ 
        php-ssh2 \
        php7.4-sybase \
        php-tideways \
        php7.4-tidy \
        php-xdebug \
        php7.4-xml \
        php7.4-xmlrpc \
        php7.4-xsl \
        php-yaml \
        php-zmq \
        php7.4-zip \
        php7.4-mysql \
        git \
        vim \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo \
    && composer clear-cache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

STOPSIGNAL SIGQUIT

# Adaptações para funcionar no docker
ADD https://raw.githubusercontent.com/ricardopedias/php-project-images/master/php74/overrides.conf /etc/php/7.4/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm7.4", "-O" ]

EXPOSE 9000
