#!/bin/bash
#
# build-all.sh - Compila todas as imagens para teste
#
# --------------------------------------------------------------------------------------------------------------------
# Este programa não precisa de parâmetros
# --------------------------------------------------------------------------------------------------------------------
#
# Licença: MIT
#

DEV_NETWORK='dev-network';

# cria a rede se ela não exitir
docker network create --driver bridge $DEV_NETWORK || true

# apaga os containerr
docker container rm php80 --force
docker container rm mysql80 --force
docker container rm nginx119 --force
docker container rm composer20 --force
docker container rm phpmyadmin51 --force
docker container rm rabbitmq38 --force

# gera as novas imagens
cd php80; docker build . -t local/php-project:php80 -f Dockerfile; cd ..
cd mysql80; docker build . -t local/php-project:mysql80 -f Dockerfile; cd ..
cd nginx119; docker build . -t local/php-project:nginx119 -f Dockerfile; cd ..
cd composer20; docker build . -t local/php-project:composer20 -f Dockerfile; cd ..
cd phpmyadmin51; docker build . -t local/php-project:phpmyadmin51 -f Dockerfile; cd ..
cd rabbitmq38; docker build . -t local/php-project:rabbitmq38 -f Dockerfile; cd ..

echo -e "\033[1;32m Operação concluída!\033[0m";

docker container ls;

docker-compose up -d
