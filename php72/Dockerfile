#-------------------------------------------------------------------------------------
# PhpProject - PHP 7.2
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
        php7.2-cli \
	    php7.2-fpm \
	    php7.2-bcmath \
        php7.2-bz2 \
        php7.2-calendar \
        php7.2-curl \
        php7.2-dba \
        php7.2-enchant \
        php7.2-exif \
        php7.2-gd \
        php-gearman \
        php-igbinary \
        php-imagick \
        php7.2-imap \
        php7.2-interbase \
        php7.2-intl \
        php7.2-gmp \
        php7.2-json \
        php7.2-ldap \
        php7.2-mbstring \
        php-memcached \
        php7.2-mysql \
        php-mongodb \
        php-msgpack \
        php7.2-odbc \
        php7.2-opcache \
        php7.2-pgsql \
        php7.2-phpdbg \
        php7.2-pspell \
        php-raphf \
        php7.2-readline \
        php7.2-recode \
        php-redis \
        php7.2-soap \
        php7.2-sqlite3 \ 
        php-ssh2 \
        php7.2-sybase \
        php-tideways \
        php7.2-tidy \
        php-xdebug \
        php7.2-xml \
        php7.2-xmlrpc \
        php7.2-xsl \
        php-yaml \
        php-zmq \
        php7.2-zip \
        php7.2-mysql \
        git \
        vim \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo \
    && composer clear-cache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

STOPSIGNAL SIGQUIT

# Adaptações para funcionar no docker
COPY overrides.conf /etc/php/7.2/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm7.2", "-O" ]

# Open up fcgi port
EXPOSE 9000
