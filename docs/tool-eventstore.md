# Event Store

O EventStoreDB foi desenvolvido para oferecer suporte ao Event Sourcing. Oferece suporte para anexar 
e ler eventos idempotentes de fluxos individuais.

Usa o protocolo gRPC para comunicação cliente-servidor, o que permite fornecer SDKs para uma ampla 
variedade de linguagens e plataformas.

Mais informações em [https://www.eventstore.com](https://www.eventstore.com/).

## Aplicabilidade

Para implementar projetos com Event Sourcing.

## Acesso aos recursos

As portas originais foram mapeadas através do compose.yaml, como seguem demonstradas na tabela:

| Descrição       | Porta Original | Porta Mapeada | URI                         |
| --------------- | -------------- | ------------- | --------------------------- |
|  Acesso/Recurso | 1112           | ????          |                             |
|                 | 1113           | ????          |                             |
|                 | 2112           | ????          |                             |
|                 | 2113           | ????          |                             |

## Docker Compose

Um exemplo de configuração via Docker Compose:

```
version: "3.1"
services:
  eventstore:
    image: ricardopedias/docker-project:eventstore212
    container_name: project-eventstore
    volumes:
      - ./storage/eventstore-data:/var/lib/eventstore
      - ./logs/eventstore-logs:/var/log/eventstore
    ports:
      - "1000:1112"
      - "1001:1113"
      - "1002:2112"
      - "1003:2113"
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