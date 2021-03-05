#!/bin/bash
#
# build.sh - Compila uma imagem docker contida neste projeto
#
# --------------------------------------------------------------------------------------------------------------------
# Este programa recebe como parâmetro a tag correspondente ao diretório onde se encontra o Dockerfile a ser compilado
# --------------------------------------------------------------------------------------------------------------------
#
# Licença: MIT
#

if [ ! -d ../${1} ]; then
    echo -e "\033[0;31mO diretório ${1} não existe!\033[0m"
    exit 1
fi

DEV_NETWORK='dev-network';

# cria a rede se ela não exitir
docker network create --driver bridge $DEV_NETWORK || true

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build da nova imagem\033[0m";
echo ""

# apaga o container
docker container rm ${1} --force

# gera a nova imagem
cd ../${1}
docker build . -t local/docker-project:${1} -f Dockerfile

cd ../docker-builds

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo o container\033[0m";
echo ""

cd ../docker-projects

docker run -d -it --name="${1}" \
    --network $DEV_NETWORK \
    --volume $(pwd)/php:/application \
    -p ${2}:80 \
    local/docker-project:${1}

# --mount type=bind,source="$(pwd)/docker-php.ini",target="/etc/php/7.4/fpm/conf.d/docker-php.ini"

docker exec -it ${1} bash

cd ../docker-builds