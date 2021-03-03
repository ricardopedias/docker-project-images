# Riak KV

Com um design de chave/valor, que oferece modelos de dados poderosos - mas simples - para armazenar 
grandes quantidades de dados não estruturados, o Riak KV foi desenvolvido para lidar com uma variedade 
de desafios enfrentados por aplicativos de Big Data que incluem rastreamento de informações de usuário 
ou sessão, armazenamento de dados de dispositivos conectados replicando dados em todo o mundo.

O Riak KV automatiza a distribuição de dados em todo o cluster para obter desempenho rápido e continuidade 
de negócios robusta com uma arquitetura masterless que garante alta disponibilidade e escala quase 
linear usando hardware comum para que você possa adicionar capacidade facilmente sem uma grande carga 
operacional.

Mais informações em [https://riak.com](https://riak.com/products/riak-kv/index.html).

## Objetivos

Se você quer algo como o armazenamento de dados do Dynamo, mas de jeito nenhum você vai lidar com o 
inchaço e a complexidade. Se você precisa de ótima escalabilidade, disponibilidade e tolerância a 
falhas em um único site, mas está pronto para pagar pela replicação em vários sites.

## Aplicabilidade

Coleta de dados de ponto de venda. Sistemas de controle de fábrica. Lugares onde até segundos de 
inatividade doem. Pode ser usado como um servidor da web com capacidade de atualização.

## Informações Técnicas

- **Escrito em:** Erlang & C, algum JavaScript
- **Ponto principal:** tolerância a falhas
- **Licença:** Apache
- **Protocolo:** HTTP / REST ou binário personalizado
- Armazena blobs
- Compromissos ajustáveis ​​para distribuição e replicação
- Ganchos pré e pós-commit em JavaScript ou Erlang, para validação e segurança.
- Map/reduce em JavaScript ou Erlang
- Links & link walking: use-o como um banco de dados de gráficos
- Índices secundários: mas apenas um de cada vez
- Suporte para objetos grandes (Luwak)
- Vem nas edições "open source" e "enterprise"
- Pesquisa de texto completo, indexação e consulta com Riak Search
- No processo de migração do back-end de armazenamento de "Bitcask" para "LevelDB" do Google
- A replicação multi-site masterless e o monitoramento SNMP são licenciados comercialmente

## Acesso aos recursos

As portas originais foram mapeadas através do docker-compose.yml, como seguem demonstradas na tabela:

| Descrição       | Porta Original | Porta Mapeada | URI                         |
| --------------- | -------------- | ------------- | --------------------------- |
|  Acesso/Recurso | 8087           | 1050          |                             |
|  Admin          | 8098           | 1060          | http://localhost:1060/admin |
|  API            | 8098           | 1060          | http://localhost:1060       |


## Bibliotecas e SDKs para PHP

- [php-amqplib](https://github.com/php-amqplib/php-amqplib) a pure PHP, fully featured RabbitMQ client

## Links importantes

Os links abaixo foram usados para obter as informações necessárias para gerar a imagem neste projeto:

- [Site Oficial](https://riak.com/products/riak-kv/index.html)
- [Docker HUB](https://hub.docker.com/r/basho/riak-kv)
- [Git HUB](https://github.com/basho-labs/riak-docker)