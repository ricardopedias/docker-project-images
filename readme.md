# Docker Project Images

Tratam-se de imagens contendo instalações pré-configuradas e exclusivas para desenvolvimento de 
aplicações.  A idéia é facilitar a configuração de ambientes, usando apenas um arquivo 
*docker-compose.yml* e nada mais.

As imagens **não foram criadas para utilização em ambientes de produção!** São imagens grandes,
contendo ferramentas e extensões que podem ser desnecessárias para outro fim que não seja o uso para
desenvolvimento. 

> **IMPORTANTE**: este repositório está em desenvolvimento e vários ajustes estão sendo feitos ainda.
Use por sua conta e risco!


## Linguagens

- [PHP](docs/tool-php.md)

## Bancos de Dados SQL

- [MySQL 5.7](docs/tool-mysql.md)
- [MySQL 8.0](docs/tool-mysql.md)
- [Mariadb 10.5](docs/tool-mysql.md)
- Percona 8.0
- Postgres 13.2

## Bancos de Dados NoSQL

- [Riak KV 2.2](docs/tool-riakkv.md)
## Mensageria

- [RabbitMQ 3.8](docs/tool-rabbitmq.md)
- [Kafka 2.7](docs/tool-kafka.md)

## Outras informações

- [Docker Hub Automated Builds](docs/automated-builds.md)
