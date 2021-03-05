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
docker container rm project-postgres --force
docker container rm project-mariadb --force
docker container rm project-percona --force

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build das novas imagens\033[0m";
echo ""

# Linguagens
cd ../nginx119; docker build . -t local/docker-project:nginx119 -f Dockerfile; cd ../docker-builds
cd ../php80; docker build . -t local/docker-project:php80 -f Dockerfile; cd ../docker-builds
cd ../composer20; docker build . -t local/docker-project:composer20 -f Dockerfile; cd ../docker-builds

# Bancos relacionais
cd ../mysql80; docker build . -t local/docker-project:mysql80 -f Dockerfile; cd ../docker-builds
cd ../mariadb105; docker build . -t local/docker-project:mariadb105 -f Dockerfile; cd ../docker-builds
cd ../percona80; docker build . -t local/docker-project:percona80 -f Dockerfile; cd ../docker-builds
cd ../postgres13; docker build . -t local/docker-project:postgres13 -f Dockerfile; cd ../docker-builds

# Paineis administrativos para bancos relacionais
cd ../phpmyadmin51; docker build . -t local/docker-project:phpmyadmin51 -f Dockerfile; cd ../docker-builds

# Bancos não relacionais
cd ../riakkv22; docker build . -t local/docker-project:riakkv22 -f Dockerfile; cd ../docker-builds
cd ../zookeeper35; docker build . -t local/docker-project:zookeeper35 -f Dockerfile; cd ../docker-builds
cd ../kafka27; docker build . -t local/docker-project:kafka27 -f Dockerfile; cd ../docker-builds
cd ../kafdrop327; docker build . -t local/docker-project:kafdrop327 -f Dockerfile; cd ../docker-builds

# Mensageria
cd ../rabbitmq38; docker build . -t local/docker-project:rabbitmq38 -f Dockerfile; cd ../docker-builds


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
