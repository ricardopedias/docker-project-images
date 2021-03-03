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

if [ ! -d ./${1} ]; then
    echo -e "\033[0;31mO diretório ${1} não existe!\033[0m"
    exit 1
fi

DEV_NETWORK='dev-network';

# cria a rede se ela não exitir
docker network create --driver bridge $DEV_NETWORK || true

# apaga o container
docker container rm ${1} --force

# gera a nova imagem
cd ../${1}
docker build . -t local/docker-project:${1} -f Dockerfile
cd ../docker-builds

# docker run -d -it --name="${1}" \
#     --network $DEV_NETWORK \
#     --volume $(pwd)/project:/application \
#     -p 8080:80 \
#     local/php-project:${1}

# --mount type=bind,source="$(pwd)/docker-php.ini",target="/etc/php/7.4/fpm/conf.d/docker-php.ini"

echo -e "\033[1;32m Operação concluída!\033[0m"

docker container ls

docker-compose up -d
