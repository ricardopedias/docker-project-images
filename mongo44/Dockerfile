#-------------------------------------------------------------------------------------
# PhpProject - Mongo 4.4.4
# Imagem oficial (Docker Hub): https://github.com/docker-library/mongo/
#-------------------------------------------------------------------------------------

FROM mongo:4.4.4-bionic

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

ENV MONGO_INITDB_ROOT_USERNAME devel
ENV MONGO_INITDB_ROOT_PASSWORD devel

# VOLUME /data/db /data/configdb

# grab tini for signal processing and zombie killing
# ENV TINI_VERSION 0.9.0

# RUN set -x \
# 	&& apt-get update && apt-get install -y ca-certificates curl \
# 		--no-install-recommends \
# 	&& apt-get install -y gpg \
# 	&& curl -fSL "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini" -o /usr/local/bin/tini \
# 	&& curl -fSL "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini.asc" -o /usr/local/bin/tini.asc \
# 	&& export GNUPGHOME="$(mktemp -d)" \
# 	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 6380DC428747F6C393FEACA59A84159D7001A4E5 \
# 	&& gpg --batch --verify /usr/local/bin/tini.asc /usr/local/bin/tini \
# 	&& rm -r "$GNUPGHOME" /usr/local/bin/tini.asc \
# 	&& chmod +x /usr/local/bin/tini \
# 	&& tini -h \
# 	&& apt-get purge --auto-remove -y ca-certificates curl \
# 	&& rm -rf /var/lib/apt/lists/*

# EXPOSE 8081

# override some config defaults with values that will work better for docker
ENV ME_CONFIG_EDITORTHEME="default" \
    ME_CONFIG_MONGODB_SERVER="mongo" \
    ME_CONFIG_MONGODB_ENABLE_ADMIN="true" \
    ME_CONFIG_BASICAUTH_USERNAME="devel" \
    ME_CONFIG_BASICAUTH_PASSWORD="devel" \
    ME_CONFIG_BASICAUTH_USERNAME_FILE="" \
    ME_CONFIG_BASICAUTH_PASSWORD_FILE="" \
    ME_CONFIG_MONGODB_ADMINUSERNAME_FILE="" \
    ME_CONFIG_MONGODB_ADMINPASSWORD_FILE="" \
    ME_CONFIG_MONGODB_AUTH_USERNAME_FILE="" \
    ME_CONFIG_MONGODB_AUTH_PASSWORD_FILE="" \
    ME_CONFIG_MONGODB_CA_FILE="" \
    VCAP_APP_HOST="0.0.0.0"

RUN set -x; \ 
    apt-get update; \
    apt-get install -y --no-install-recommends git unzip curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN set -x; \ 
    apt-get update; \
    apt-get install -y nodejs

RUN mkdir /mongo-install
ADD mongo-express-master.zip /mongo-install/mongo-express-master.zip
RUN cd /mongo-install \
    && unzip mongo-express-master.zip \
    && mv mongo-express-master/ /app

RUN cd /app \
    && cp config.default.js config.js \
    && npm install

RUN cd /app \
    && npm run build

RUN apt-get purge --auto-remove -y git
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

#COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 27017 8081
CMD ["mongod"]
