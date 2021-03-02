# Ferramentas e Portas

As seguintes ferramentas estão disponíveis:

| Ferramenta      | Porta Externa | Porta Interna |
| --------------- | ------------- | ------------- |
|  nginx          | 1000          | 80            |
|  php-fpm        | 9000          | 9000          |
|  mysql          | 1010          | 3306          |
|  phpmyadmin     | 1020          | 80            |
|  rabbitmq       | 1030          | 5672          |
|  rabbitmq-admin | 1040          | 15672         |

No arquivo docker-compose.yml de exemplo, as imagens são obtidas localmente após o processo de build.
Para usar as imagens disponíveis no Docker HUB, é preciso substituir o namespace das imagens.

Exemplo `local/php-project:php80` deve ser mudado para `ricardopedias/php-project:php80`
