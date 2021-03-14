#!/bin/bash

CONTAINER=$(basename $(pwd))
PROJECT="$(pwd)/project"
DEV_NETWORK='dev-network'

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

cd ../docker-projects

docker run -d -it --name="$CONTAINER" \
    --network $DEV_NETWORK \
    --volume "$PROJECT/php:/usr/local/tomcat/webapps/application" \
    -p 80:8080 \
    local/docker-project:$CONTAINER

docker exec -it $CONTAINER bash

cd ../docker-builds