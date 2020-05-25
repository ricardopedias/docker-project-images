#-------------------------------------------------------------------------------------
# PhpProject - Laravel 7
#-------------------------------------------------------------------------------------

FROM ricardopedias/php-project:php74

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Configuração dos repositórios do Ondrej para Ubuntu Bionic, 
# instalação do PHP e ferramentas úteis

RUN cd /app \
    && composer create-project --prefer-dist laravel/laravel . \
    && php artisan key:generate \
    && chmod -Rf 777 bootstrap/cache \
    && chmod -Rf 777 storage \
    && composer require laravel/passport \
    && php artisan passport:install \
    && php artisan passport:keys;

STOPSIGNAL SIGQUIT

CMD ["/usr/sbin/php-fpm7.4", "-O" ]

EXPOSE 9000
