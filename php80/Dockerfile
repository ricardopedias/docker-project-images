#-------------------------------------------------------------------------------------
# PhpProject - PHP 8.0
#-------------------------------------------------------------------------------------

FROM ubuntu:groovy

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
        php-gearman \
        php-igbinary \
        php-imagick \
        php8.0-imap \
        php8.0-interbase \
        php8.0-intl \
        php8.0-gmp \
        php8.0-json \
        php8.0-ldap \
        php8.0-mbstring \
        php-memcached \
        php8.0-mysql \
        php-mongodb \
        php-msgpack \
        php8.0-odbc \
        php8.0-opcache \
        php8.0-pgsql \
        php8.0-phpdbg \
        php8.0-pspell \
        php-raphf \
        php8.0-readline \
        php-redis \
        php8.0-soap \
        php8.0-sqlite3 \ 
        php-ssh2 \
        php8.0-sybase \
        php-tideways \
        php8.0-tidy \
        php-xdebug \
        php8.0-xml \
        php8.0-xmlrpc \
        php8.0-xsl \
        php-yaml \
        php-zmq \
        php8.0-zip \
        php8.0-mysql \
        git \
        vim \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer clear-cache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

STOPSIGNAL SIGQUIT

# Adaptações para funcionar no docker
ADD https://raw.githubusercontent.com/ricardopedias/php-project-images/master/php80/overrides.conf /etc/php/8.0/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm8.0", "-O" ]

EXPOSE 9000
