# Java

As imagens do java já possuem o servidor Tomcat configurado e acessível através da porta 8080, que pode ser mapeada para uma outra através da execução do container via Docker ou Docker Compose.

As seguintes versões da linguagem estão presentes:

- Java 15 ricardopedias/docker-project:java15

## Docker Compose

Um exemplo de configuração via Docker Compose:

```
version: "3.1"
services:
  java:
    image: ricardopedias/docker-project:java15
    container_name: container-java
    volumes:
      - ./:/usr/local/tomcat/webapps/ROOT
    ports:
      - "10000:8080"
    networks:
      - dev-network
      
networks:
  dev-network:
    driver: bridge
```
