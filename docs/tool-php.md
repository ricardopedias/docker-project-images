# PHP

As imagens do PHP já possuem o servidor Nginx configurado e acessível através da porta 80, que pode
ser mapeada para uma outra através da execução do container via Docker ou Docker Compose.

As seguintes versões da linguagem estão presentes:

- PHP 5.6 ricardopedias/docker-project:php56
- PHP 7.4 ricardopedias/docker-project:php74
- PHP 8.0 ricardopedias/docker-project:php80

## Docker Compose

Um exemplo de configuração via Docker Compose:

```
version: "3.1"
services:
  php:
    image: ricardopedias/docker-project:php80
    container_name: container-php
    volumes:
      - .:/application
    ports:
      - "8080:80"
    networks:
      - my-network
      
networks:
  dev-network:
    driver: bridge
```
