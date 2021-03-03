#-------------------------------------------------------------------------------------
# PhpProject - Apache Zookepper (Confluentinc Platform)
# https://hub.docker.com/layers/confluentinc/cp-zookeeper
# https://github.com/confluentinc/kafka-images
# https://docs.confluent.io/platform/current/installation/versions-interoperability.html
#-------------------------------------------------------------------------------------

# Zookepper 3.5.8
# Java 1.8.0_202, 11.0_4
# Scala 2.12, 2.13
FROM confluentinc/cp-zookeeper:6.1.0

ENV ZOOKEEPER_CLIENT_PORT 2181
ENV ZOOKEEPER_TICK_TIME 2000

CMD ["/etc/confluent/docker/run"]

EXPOSE 2181 2000