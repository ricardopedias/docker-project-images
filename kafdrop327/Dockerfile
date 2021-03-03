#-------------------------------------------------------------------------------------
# PhpProject - Apache Kafka 2.7
# https://hub.docker.com/r/obsidiandynamics/kafdrop
# https://github.com/obsidiandynamics/kafdrop
#-------------------------------------------------------------------------------------

FROM obsidiandynamics/kafdrop:3.27.0

ENV KAFKA_BROKERCONNECT kafka:29092

EXPOSE 9000

ENTRYPOINT ["/kafdrop.sh"]