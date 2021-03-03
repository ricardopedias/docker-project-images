# Portas configuradas no Docker Compose

Os arquivos do Docker Compose (docker-compose.yml) existentes no diretório `projects` seguem um 
esquema, de forma que nas portas são mapeadas a fim de que nenhuma ferramenta entre em conflito,
tornando possível a ativação de todas juntas (desde que seja apenas uma versão de cada ferramenta).

Embora você possa configurar o docker-compose.yml do seu gosto, mapeando para portas diferentes,
preferiu-se usar um esquema para facilitar a vida daqueles que desejam começar a usar rapidamente.

As portas originais foram mapeadas da sehuinte forma:

| Ferramenta      | Porta Original | Porta Mapeada |
| --------------- | -------------- | ------------- |
|  nginx          | 80             | 1000          |
|  mysql          | 3306           | 1010          |
|  phpmyadmin     | 80             | 1020          |
|  rabbitmq       | 5672           | 1030          |
|  rabbitmq adm   | 15672          | 1040          |
|  riak-kv        | 8087           | 1050          |
|  riak-kv adm    | 8098           | 1060          |
|  zookeeper      | 2181           | 1070          |
|  zookeeper      | 2000           | 1080          |
|  kafka          | 9092           | 1090          |
|  kafdrop        | 9000           | 2000          |



