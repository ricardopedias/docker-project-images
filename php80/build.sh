#!/bin/bash

LOCAL_CONTAINER="teste-local-php80"
LOCAL_PROJECT="$(pwd)/example-project"
LOCAL_NETWORK="dev-network"
LOCAL_PORT="1111"
DOCKER_HUB_USER="ricardopedias"
DOCKER_HUB_TAG=$(basename $(pwd))

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Build da nova imagem\033[0m";
echo ""

# apaga o container
docker container rm $DOCKER_HUB_TAG --force

# gera a nova imagem
docker build . -t $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG -f Dockerfile

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Subindo o container\033[0m";
echo ""

DOCKER_HUB_SENDED=0

read -p "Deseja enviar para o DockerHub? [s ou n]" -n 1 -r
echo    # isso mesmo, nova linha :(
if [[ $REPLY =~ ^[Ss]$ ]]
then
    # envia para o dockerhub
    docker login --username $DOCKER_HUB_USER
    docker push $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG

    # Remove a imagem local
    docker rmi $(docker images $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG -a -q) --force

    DOCKER_HUB_SENDED=1

    echo ""
    echo "-----------------------------------------------------------------"
    echo ""
    echo -e "\033[1;32m Imagem enviada com sucesso!\033[0m";
    echo ""
   
fi

echo ""
echo "-----------------------------------------------------------------"
echo ""
echo -e "\033[1;32m Sincronizando a imagem local com o dockerhub\033[0m";
echo ""


# Cria a rede se ela não exitir
docker network rm $LOCAL_NETWORK
docker network create --driver bridge $LOCAL_NETWORK

# Recria o conteiner
docker container rm $LOCAL_CONTAINER --force
docker run -d -it --name="$LOCAL_CONTAINER" \
    --env WORKER_PATH=/application/public \
    --env WORKER_FILE=worker.php \
    --network $LOCAL_NETWORK \
    --volume "$LOCAL_PROJECT:/application" \
    -p $LOCAL_PORT:80 \
    $DOCKER_HUB_USER/docker-project:$DOCKER_HUB_TAG
    