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
echo -e "\033[1;32m Sincronizando a imagem local com o dockerhub\033[0m";
echo ""

# envia para o dockerhub
docker login --username $DOCKER_HUB_USER
docker push $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG

# Remove a imagem local
docker rmi $(docker images $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG -a -q) --force
