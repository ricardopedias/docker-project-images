# Portas configuradas no Docker Compose

Os exemplos do Docker Compose (docker-compose.yml) existentes na documentação seguem um 
esquema, de forma que nas portas são mapeadas para nenhuma ferramenta entre em conflito,
tornando possível a ativação de todas juntas (desde que seja apenas uma versão de cada ferramenta).

Embora você possa configurar o docker-compose.yml do seu gosto, mapeando para portas diferentes,
preferiu-se usar um esquema para facilitar a vida daqueles que desejam começar a usar rapidamente.

As portas originais foram mapeadas da seguinte forma:

| Linguagem       | Porta Original | Porta Mapeada |
| --------------- | -------------- | ------------- |
|  php56          | 80             | 1000          |
|  php74          | 80             | 1001          |
|  php80          | 80             | 1002          |

| Banco SQL       | Porta Original | Porta Mapeada |
| --------------- | -------------- | ------------- |
|  mysql          | 3306           | 2000          |
|  mysql adm      | 3306           | 2001          |
|  mariadb        | 3306           | 2002          |
|  mariadb adm    | 3306           | 2003          |
|  percona        | 3306           | 2004          |
|  percona adm    | 3306           | 2005          |
|  postgres       | 8080           | 2006          |
|  postgres adm   | 8080           | 2007          |

| Banco NoSQL     | Porta Original | Porta Mapeada |
| --------------- | -------------- | ------------- |
|  riak-kv        | 8087           | 3000          |
|  riak-kv adm    | 8098           | 3001          |
|  eventstore     | 8098           | 3002          |

| Mensageria      | Porta Original | Porta Mapeada |
| --------------- | -------------- | ------------- |
|  rabbitmq       | 5672           | 4000          |
|  rabbitmq adm   | 15672          | 4001          |
|  zookeeper      | 2181           | 4002          |
|  zookeeper      | 2000           | 4003          |
|  kafka          | 9092           | 4004          |
|  kafka adm      | 9000           | 4005          |



