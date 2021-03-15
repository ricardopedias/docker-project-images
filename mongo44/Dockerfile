#-------------------------------------------------------------------------------------
# DockerProject - Mongo 4.4.4
# https://github.com/docker-library/mongo/
#-------------------------------------------------------------------------------------

FROM mongo:4.4.4-bionic

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

ENV MONGO_INITDB_DATABASE devel
ENV MONGO_INITDB_ROOT_USERNAME devel
ENV MONGO_INITDB_ROOT_PASSWORD devel

WORKDIR /data/db

EXPOSE 27017
CMD ["mongod"]
