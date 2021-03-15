#-------------------------------------------------------------------------------------
# DockerProject - Mongo 4.4.4
# https://hub.docker.com/_/mongo-express
# https://github.com/mongo-express/mongo-express-docker
#-------------------------------------------------------------------------------------

FROM mongo-express:0.54

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

ENV ME_CONFIG_OPTIONS_EDITORTHEME ambiance
# ENV ME_CONFIG_BASICAUTH_USERNAME devel
# ENV ME_CONFIG_BASICAUTH_PASSWORD devel

ENV ME_CONFIG_MONGODB_PORT 27017
ENV ME_CONFIG_MONGODB_ADMINUSERNAME devel
ENV ME_CONFIG_MONGODB_ADMINPASSWORD devel

ENV ME_CONFIG_MONGODB_AUTH_DATABASE db
ENV ME_CONFIG_MONGODB_AUTH_USERNAME devel
ENV ME_CONFIG_MONGODB_AUTH_PASSWORD devel
# ENV ME_CONFIG_REQUEST_SIZE '1000kb'

EXPOSE 8081

CMD ["mongo-express"]
