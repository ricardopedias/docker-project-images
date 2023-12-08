#!/bin/bash

LOCAL_CONTAINER="teste-local-mysql57"
LOCAL_PROJECT="$(pwd)/example-project"
LOCAL_NETWORK="dev-network"
LOCAL_MYSQL_PORT="1111"
LOCAL_ADMIN_PORT="1112"
DOCKER_HUB_USER="ricardopedias"
DOCKER_HUB_TAG=$(basename $(pwd))

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build da nova imagem\033[0m";
echo ""

# apaga o container
docker container rm $DOCKER_HUB_TAG --force

# Remove a imagem local
# docker rmi $(docker images $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG -a -q) --force

# gera a nova imagem
docker build . -t $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG -f Dockerfile

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo o container\033[0m";
echo ""

# Cria a rede se ela não exitir
docker network rm $LOCAL_NETWORK
docker network create --driver bridge $LOCAL_NETWORK

# Recria o conteiner
docker container rm $LOCAL_CONTAINER --force

docker run -d -it --name="$LOCAL_CONTAINER" \
    --network $LOCAL_NETWORK \
    --volume "$LOCAL_PROJECT:/var/lib/mysql" \
    -p $LOCAL_ADMIN_PORT:80 \
    -p $LOCAL_MYSQL_PORT:3306 \
    $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG
    