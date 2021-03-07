#-------------------------------------------------------------------------------------
# PhpProject - EventStore 21.2
# Imagem oficial (Docker Hub): https://hub.docker.com/r/eventstore/eventstore/
#-------------------------------------------------------------------------------------

FROM eventstore/eventstore:21.2.0-bionic

ENV EVENTSTORE_CLUSTER_SIZE 1
ENV EVENTSTORE_RUN_PROJECTIONS All
ENV EVENTSTORE_START_STANDARD_PROJECTIONS true
ENV EVENTSTORE_EXT_TCP_PORT 1113
ENV EVENTSTORE_EXT_HTTP_PORT 2113
ENV EVENTSTORE_INSECURE true
ENV EVENTSTORE_ENABLE_EXTERNAL_TCP true
ENV EVENTSTORE_ENABLE_ATOM_PUB_OVER_HTTP true

EXPOSE 1112/tcp
EXPOSE 1113/tcp
EXPOSE 2112/tcp
EXPOSE 2113/tcp

