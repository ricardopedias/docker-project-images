# MongoDB

Mais informações em [https://www.mongodb.com/3](https://www.mongodb.com/3).

## Aplicabilidade

Para implementar projetos com bases NoSQL.

## Acesso aos recursos

As portas originais foram mapeadas através do docker-compose.yml, como seguem demonstradas na tabela:

| Descrição       | Porta Original | Porta Mapeada | URI                         |
| --------------- | -------------- | ------------- | --------------------------- |
|  Acesso         | 27017          | ????          |                             |
|  Admin          | 8081           | ????          |                             |

## Docker Compose

Um exemplo de configuração via Docker Compose:

```
version: "3.1"
services:
  eventstore:
    image: ricardopedias/docker-project:mongo44
    container_name: project-eventstore
    volumes:
      - ./storage/mongo-data:/data/db 
      - ./storage/mongo-config:/data/configdb
    ports:
      - "1000:27017"
      - "1001:8081"
    networks:
      - dev-network
      
networks:
  dev-network:
    driver: bridge
```

## Bibliotecas e SDKs para PHP

- [Prooph Event Store](https://github.com/prooph/event-store)
- [EventStore PHP client](https://github.com/FriendsOfOuro/geteventstore-php-core)
- [Prooph Event Store HTTP Client](https://github.com/prooph/event-store-http-client/)
- [Event Store Client](https://github.com/madkom/event-store-client)

## Links importantes

Os links abaixo foram usados para obter as informações necessárias para gerar a imagem neste projeto:

- [Site Oficial](https://www.eventstore.com)
- [Documentação](https://developers.eventstore.com/)
- [Docker HUB](https://hub.docker.com/r/eventstore/eventstore)
- [Git HUB](https://github.com/EventStore/EventStore)