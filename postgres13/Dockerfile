#-------------------------------------------------------------------------------------
# DockerProject - Postgres 13.2
# Imagem oficial (Docker Hub): https://hub.docker.com/_/postgres
# Imagem oficial (Git Hub): https://github.com/docker-library/postgres
#-------------------------------------------------------------------------------------

FROM postgres:13

RUN mkdir -p /application

WORKDIR /application

ENV POSTGRES_DB devel
ENV POSTGRES_USER devel
ENV POSTGRES_PASSWORD devel

CMD ["postgres"]

EXPOSE 5432
