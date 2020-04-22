#-------------------------------------------------------------------------------------
# PhpProject - PHP 7.3
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
        php7.3-cli \
	    php7.3-fpm \
	    php7.3-bcmath \
        php7.3-bz2 \
        php7.3-calendar \
        php7.3-curl \
        php7.3-dba \
        php7.3-enchant \
        php7.3-exif \
        php7.3-gd \
        php-gearman \
        php-igbinary \
        php-imagick \
        php7.3-imap \
        php7.3-interbase \
        php7.3-intl \
        php7.3-gmp \
        php7.3-json \
        php7.3-ldap \
        php7.3-mbstring \
        php-memcached \
        php7.3-mysql \
        php-mongodb \
        php-msgpack \
        php7.3-odbc \
        php7.3-opcache \
        php7.3-pgsql \
        php7.3-phpdbg \
        php7.3-pspell \
        php-raphf \
        php7.3-readline \
        php7.3-recode \
        php-redis \
        php7.3-soap \
        php7.3-sqlite3 \ 
        php-ssh2 \
        php7.3-sybase \
        php-tideways \
        php7.3-tidy \
        php-xdebug \
        php7.3-xml \
        php7.3-xmlrpc \
        php7.3-xsl \
        php-yaml \
        php-zmq \
        php7.3-zip \
        php7.3-mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo \
    && composer clear-cache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

STOPSIGNAL SIGQUIT

# Adaptações para funcionar no docker
ADD https://raw.githubusercontent.com/ricardopedias/php-project-images/master/php73/overrides.conf /etc/php/7.3/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm7.3", "-O" ]

EXPOSE 9000
