#-------------------------------------------------------------------------------------
# PhpProject - Apache Kafka (Confluentinc Platform)
# https://hub.docker.com/layers/confluentinc/cp-kafka
# https://github.com/confluentinc/kafka-images
# https://docs.confluent.io/platform/current/installation/versions-interoperability.html
#-------------------------------------------------------------------------------------

# Kafka 2.7.x
# Java 1.8.0_202, 11.0_4
# Scala 2.12, 2.13
FROM confluentinc/cp-kafka:6.1.0

ENV KAFKA_BROKER_ID 1
ENV KAFKA_ZOOKEEPER_CONNECT zookeeper:2181
ENV KAFKA_ADVERTISED_LISTENERS PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092
ENV KAFKA_LISTENER_SECURITY_PROTOCOL_MAP PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
ENV KAFKA_INTER_BROKER_LISTENER_NAME PLAINTEXT
ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR 1

CMD ["/etc/confluent/docker/run"]

EXPOSE 9092 29092