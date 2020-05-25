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

RUN mkdir -p /app
RUN chmod 750 /app
RUN chown www-data:www-data /app
RUN composer create-project --prefer-dist laravel/laravel /app
RUN cd /app && php artisan key:generate
RUN cd /app && chmod -Rf 777 bootstrap/cache
RUN cd /app && chmod -Rf 777 storage

STOPSIGNAL SIGQUIT

CMD ["/usr/sbin/php-fpm7.4", "-O" ]

EXPOSE 9000
