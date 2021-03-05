# Apache Kafka

Apache Kafka é uma plataforma de streaming (fluxo de dados) de eventos distribuídos de código aberto 
usada por milhares de empresas para pipelines de dados de alto desempenho, análise de streaming, 
integração de dados e aplicativos de missão crítica. 

O Apache Kafka é uma plataforma de stream (fluxo de dados) de alto throughput que desacopla os produtores de dados dos consumidores de dados

Kafka é um barramento de mensagens otimizado para fluxos de dados com alta entrada e reprodução, que 
pode ser visto como um intermediário de mensagens durável, onde os aplicativos podem processar 
e reprocessar dados transmitidos em disco. Ele tem uma abordagem de roteamento muito simples. 

Mais informações em [https://kafka.apache.org](https://kafka.apache.org).

## Objetivos

Ofereça suporte a casos de uso de missão crítica com pedido garantido, perda zero de mensagens e 
processamento eficiente de uma só vez.

Integrar sistemas com grande volume de dados. Mover uma grande quantidade de dados, processar dados 
em tempo real ou analisar dados durante um período de tempo. Oferecer suporte a consumidores em lote 
que podem estar offline ou consumidores que desejam mensagens com baixa latência.

Oferecer funcionalidades para coleta, armazenamento e manipulação de dados. Um exemplo é quando você 
deseja acompanhar a atividade do usuário em uma loja virtual e gerar itens sugeridos para compra. 
Outro exemplo é a análise de dados para rastreamento, ingestão, registro ou segurança.

## Aplicabilidade

- Para processar pagamentos e transações financeiras em tempo real, como em bolsas de valores, bancos
  e seguros.
- Para rastrear e monitorar carros, caminhões, frotas e remessas em tempo real, como na logística e 
  na indústria automotiva.
- Para capturar e analisar continuamente os dados do sensor de dispositivos IoT ou outros equipamentos, 
  como fábricas e parques eólicos.
- Para coletar e reagir imediatamente às interações e pedidos do cliente, como no varejo, no setor de 
  hotéis e viagens e em aplicativos móveis.
- Para monitorar pacientes em cuidados hospitalares e prever mudanças nas condições para garantir o 
  tratamento oportuno em emergências.
- Conectar, armazenar e disponibilizar dados produzidos por diferentes divisões de uma empresa.
- Para servir como base para plataformas de dados, arquiteturas orientadas a eventos e microsserviços.

## Informações Técnicas

- **Escrito em:** Java/Scala
- **Ponto principal:** Processamento sem perda de mensagens
- **Licença:** Apache 2.0
- **Protocolo:** Apache Kafka
- Publish/Subscribe Arquitecture
- Sem perda de mensagens (pois são armazenadas em disco)
- Processamento em tempo real ou retrospectivamente
- O protocolo Apache Kafka suporta tópicos de quase qualquer escala

## Acesso aos recursos

O ambiente Kafka é disponibilizado por 3 imagens:

- ricardopedias/zookeeper
- ricardopedias/kafka
- ricardopedias/kaftop

As portas originais foram mapeadas através do docker-compose.yml, como seguem demonstradas na tabela:

| Descrição       | Porta Original | Porta Mapeada | URI                         |
| --------------- | -------------- | ------------- | --------------------------- |
|  Acesso/Recurso | 9092           | 1090          |                             |
|  Admin          | 9000           | 2000          | http://localhost:2000       |

## Informações de acesso

- **Usuário:** devel
- **Senha:** devel

## Bibliotecas e SDKs para PHP

- [Weiboad Kafka PHP](https://github.com/weiboad/kafka-php)
- [PHP Kafka Consumer](https://github.com/arquivei/php-kafka-consumer)
- [PHP Kafka Client](https://github.com/arnaud-lb/php-rdkafka)
- [Quipo Kafka PHP](https://github.com/quipo/kafka-php)
- [Rdkafka](https://github.com/php-enqueue/rdkafka)


## Links importantes

Os links abaixo foram usados para obter as informações necessárias para gerar a imagem neste projeto:

### Sobre Mensageria

- [O que é um Message Broker?](https://medium.com/@bookgrahms/o-que-%C3%A9-um-corretor-de-mensagens-message-broker-c9fbe219443b)
- [Disertação sobre o uso de Mensageria](https://www.ime.usp.br/~reverbel/students/master_theses/thadeu_de_russo_e_carmo.pdf)

### Sobre o Apache Kafka

- [Site Oficial](https://kafka.apache.org/)
- [Git HUB do código fonte](https://github.com/apache/kafka)
- [Introdução à plataforma](https://www.bi4all.pt/noticias/blog/apache-kafka-introducao-a-uma-plataforma-de-transmissao-de-dados/)
- [RabbitMQ vs Kafka](https://betterprogramming.pub/rabbitmq-vs-kafka-1ef22a041793)
- [Diferenças RabbitMQ e Kafka](https://betterprogramming.pub/rabbitmq-vs-kafka-1779b5b70c41)
- [Quando usar RabbitMQ ou Kafka](https://www.cloudamqp.com/blog/2019-12-12-when-to-use-rabbitmq-or-apache-kafka.html)
- [Razões para usar RabbitMQ ou Kafka](https://qastack.com.br/programming/42151544/is-there-any-reason-to-use-rabbitmq-over-kafka)
