# Docker Project Images

Tratam-se de imagens contendo instalações pré-configuradas e exclusivas para desenvolvimento de 
aplicações.  A idéia é facilitar a configuração de ambientes, usando apenas um arquivo 
*docker-compose.yml* e nada mais.

> Atenção: As imagens não foram criadas para utilização em ambientes de produção! São imagens grandes,
contendo ferramentas e extensões que podem ser desnecessárias para outro fim que não seja o uso para
desenvolvimento. 

## Linguagens

- PHP 5.6
- PHP 7.0
- PHP 7.1
- PHP 7.2
- PHP 7.3
- PHP 7.4
- PHP 8.0

## Servidores

- Nginx 1.19

## Bancos de Dados SQL

- MySQL 8.0
- PostGres 8.0

## Bancos de Dados NoSQL

- [Riak KV 2.2](docs/tools-riakkv.md)
## Mensageria

- [RabbitMQ 3.8](docs/tools-rabbitmq.md)
- [Kafka 2.7](docs/tools-kafka.md)

## Outras informações

- [Portas no Docker Compose](docs/docker-compose-ports.md)
- [Docker Hub Automated Builds](docs/automated-builds.md)
