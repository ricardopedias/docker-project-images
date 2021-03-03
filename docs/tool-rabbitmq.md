# RabbitMQ

O RabbitMQ é um *Corretor de Mensagens* (ou Message Broker) que possibilita a adoção de uma 
arquitetura Publish/Subscribe. 

> **Um Message Broker** é um software que permite que aplicações, sistemas e serviços comuniquem 
entre si e troquem informações.

Com dezenas de milhares de usuários, o RabbitMQ é um dos corretores de mensagens Open Source mais 
populares e mais amplamente implantados. Do T-Mobile ao Runtastic , o RabbitMQ é usado em todo o mundo 
em pequenas e grandes empresas.

O RabbitMQ é leve e fácil de implantar localmente ou na nuvem, além de oferecer suporte a vários 
protocolos de mensagens. O RabbitMQ pode ser implantado em configurações distribuídas e federadas 
para atender aos requisitos de alta escala e alta disponibilidade.

Pode ser executado em muitos sistemas operacionais e ambientes de nuvem, fornecendo uma ampla variedade 
de ferramentas de desenvolvedor para as linguagens mais populares.

No Kafka os aplicativos podem processar e reprocessar dados transmitidos em disco, usando uma abordagem 
de roteamento muito simples. No entanto, o RabbitMQ tem melhores opções se você precisar rotear suas 
mensagens de maneiras complexas para seus consumidores.

Mais informações em [https://www.rabbitmq.com](https://www.rabbitmq.com).

## Objetivos

Se você quer algo como o armazenamento de dados do Dynamo, mas de jeito nenhum você vai lidar com o 
inchaço e a complexidade. Se você precisa de ótima escalabilidade, disponibilidade e tolerância a 
falhas em um único site, mas está pronto para pagar pela replicação em vários sites.

## Aplicabilidade

Coleta de dados de ponto de venda. Sistemas de controle de fábrica. Lugares onde até segundos de 
inatividade doem. Pode ser usado como um servidor da web com capacidade de atualização.

## Informações Técnicas

- **Escrito em:** Erlang
- **Ponto principal:** Pode lidar com alto rendimento. Um caso de uso comum do RabbitMQ é manipular 
trabalhos em segundo plano ou tarefas de longa execução, como digitalização de arquivos, 
dimensionamento de imagens ou conversão de PDF.
- **Licença:** MPL2.0 (Mozilla Public License Version 2.0) 
- **Protocolo:** AMQP, MQTT, STOMP
- Multiple messaging protocols
- Message queuing
- Delivery acknowledgement
- Flexible routing to queues
- Multiple exchange type.

## Acesso aos recursos

As portas originais foram mapeadas através do docker-compose.yml, como seguem demonstradas na tabela:

| Descrição       | Porta Original | Porta Mapeada | URI                         |
| --------------- | -------------- | ------------- | --------------------------- |
|  Acesso/Recurso | 5672           | 1030          |                             |
|  Admin          | 15672          | 1040          | http://localhost:1040       |

## Informações de acesso

- **Usuário:** devel
- **Senha:** devel

## Bibliotecas e SDKs para PHP

- [php-amqplib](https://github.com/php-amqplib/php-amqplib) a pure PHP, fully featured RabbitMQ client
- [RabbitMqBundle](https://github.com/php-amqplib/rabbitmqbundle) incorporates RabbitMQ messaging with the Symfony2 web framework
- [PECL AMQP library](http://pecl.php.net/package/amqp) built on top of the RabbitMQ C client
- [VorpalBunny](https://github.com/myYearbook/VorpalBunny) a PHP client library using rabbitmq_jsonrpc_channel
- [Thumper](https://github.com/php-amqplib/Thumper) a library of messaging patterns
- [CAMQP](http://www.yiiframework.com/extension/amqp/) an extension for the Yii framework providing a gateway for RabbitMQ messaging
- [AMQP Interop](https://github.com/queue-interop/queue-interop#amqp-interop) is a set of unified AMQP 0-9-1 interfaces in PHP and their implementations
- [Bowler](https://github.com/Vinelab/bowler) is a RabbitMQ client abstraction for Laravel


## Links importantes

Os links abaixo foram usados para obter as informações necessárias para gerar a imagem neste projeto:

### Sobre Mensageria

- [O que é um Message Broker?](https://medium.com/@bookgrahms/o-que-%C3%A9-um-corretor-de-mensagens-message-broker-c9fbe219443b)
- [Disertação sobre o uso de Mensageria](https://www.ime.usp.br/~reverbel/students/master_theses/thadeu_de_russo_e_carmo.pdf)

### Sobre o RabbitMQ

- [Site Oficial](https://www.rabbitmq.com/)
- [Docker HUB](https://hub.docker.com/_/rabbitmq)
- [Git HUB da imagem oficial](https://github.com/docker-library/rabbitmq)
- [Git HUB do código fonte](https://github.com/rabbitmq?q=rabbitmq)
- [Como utilizar](https://blog.cedrotech.com/rabbitmq-o-que-e-e-como-utilizar/)
- [Ótimo artigo sobre o RabbitMQ](https://medium.com/dev-cave/rabbit-mq-parte-i-c15e5f89d94)
- [Conhecendo o Admin do RabbitMQ](https://medium.com/xp-inc/rabbitmq-com-docker-conhecendo-o-admin-cc81f3f6ac3b)
- [RabbitMQ vs Kafka](https://betterprogramming.pub/rabbitmq-vs-kafka-1ef22a041793)
- [Diferenças RabbitMQ e Kafka](https://betterprogramming.pub/rabbitmq-vs-kafka-1779b5b70c41)
- [Quando usar RabbitMQ ou Kafka](https://www.cloudamqp.com/blog/2019-12-12-when-to-use-rabbitmq-or-apache-kafka.html)
- [Razões para usar RabbitMQ ou Kafka](https://qastack.com.br/programming/42151544/is-there-any-reason-to-use-rabbitmq-over-kafka)
