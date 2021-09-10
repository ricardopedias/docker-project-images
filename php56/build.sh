#!/bin/bash

CONTAINER=$(basename $(pwd))
PROJECT="$(pwd)/example-project"
DEV_NETWORK="dev-network"
DEV_PORT="1111"

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

# exit
cd ../docker-builds

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo o container\033[0m";
echo ""

docker run -d -it --name="$CONTAINER" \
    --network $DEV_NETWORK \
    --volume "$PROJECT:/application" \
    -p $DEV_PORT:80 \
    local/docker-project:$CONTAINER

docker exec -it $CONTAINER bash
