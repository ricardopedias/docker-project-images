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

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Removendo containers atuais\033[0m";
echo ""

docker container rm project-php --force
docker container rm project-mysql --force
docker container rm project-nginx --force
docker container rm project-composer --force
docker container rm project-phpmyadmin --force
docker container rm project-rabbitmq --force
docker container rm project-riakkv --force
docker container rm project-zookeeper --force
docker container rm project-kafka --force
docker container rm project-kafdrop --force

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build das novas imagens\033[0m";
echo ""

# gera as novas imagens
cd php80; docker build . -t local/php-project:php80 -f Dockerfile; cd ..
cd mysql80; docker build . -t local/php-project:mysql80 -f Dockerfile; cd ..
cd nginx119; docker build . -t local/php-project:nginx119 -f Dockerfile; cd ..
cd composer20; docker build . -t local/php-project:composer20 -f Dockerfile; cd ..
cd phpmyadmin51; docker build . -t local/php-project:phpmyadmin51 -f Dockerfile; cd ..
cd rabbitmq38; docker build . -t local/php-project:rabbitmq38 -f Dockerfile; cd ..
cd riakkv22; docker build . -t local/php-project:riakkv22 -f Dockerfile; cd ..
cd zookeeper35; docker build . -t local/php-project:zookeeper35 -f Dockerfile; cd ..
cd kafka27; docker build . -t local/php-project:kafka27 -f Dockerfile; cd ..
cd kafdrop327; docker build . -t local/php-project:kafdrop327 -f Dockerfile; cd ..

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo Docker Compose\033[0m";
echo ""

docker-compose up -d

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Listando Containers\033[0m";
echo ""

docker container ls
