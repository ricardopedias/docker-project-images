#!/bin/bash

CONTAINER=$(basename $(pwd))
DEV_NETWORK='dev-network'

if test "$1" == "--kill"
then
    docker container rm $CONTAINER --force
    exit 0
fi

# cria a rede se ela não exitir
docker network create --driver bridge $DEV_NETWORK || true

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build da nova imagem\033[0m";
echo ""

# apaga o container
docker container rm $CONTAINER --force

# gera a nova imagem
docker build . -t local/docker-project:$CONTAINER -f Dockerfile

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo o container\033[0m";
echo ""

docker run -d -it --name="$CONTAINER" \
    --network $DEV_NETWORK \
    -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
    -e ME_CONFIG_MONGODB_SERVER="web_db_1" \
    -e ME_CONFIG_BASICAUTH_USERNAME="devel" \
    -e ME_CONFIG_BASICAUTH_PASSWORD="devel" \
    -e ME_CONFIG_MONGODB_PORT=27017 \
    -e ME_CONFIG_MONGODB_ADMINUSERNAME="devel" \
    -e ME_CONFIG_MONGODB_ADMINPASSWORD="devel" \
    -p "8081:8081" \
    local/docker-project:$CONTAINER

docker exec -it $CONTAINER bash
