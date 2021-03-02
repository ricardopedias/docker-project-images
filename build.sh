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
docker build -t local/php-project:${1} - < ./${1}/Dockerfile

docker run -d -it --name="${1}" \
    --network $DEV_NETWORK \
    --volume $(pwd)/project:/application \
    local/php-project:php80

# --mount type=bind,source="$(pwd)/docker-php.ini",target="/etc/php/7.4/fpm/conf.d/docker-php.ini"

docker container ls

echo -e "\033[1;32mImagem gerada com sucesso!\033[0m"

docker exec -it php80 bash

exit 0


# echo -e "------------------------------------------------";
# echo -e "[0;32m✔[0m Escutando logs";
# # docker exec -it "app-$PROJECT_NAME" bash
# docker logs "app-$PROJECT_NAME"
# docker logs "server-$PROJECT_NAME" -f