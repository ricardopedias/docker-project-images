#-------------------------------------------------------------------------------------
# PhpProject - RabbitMQ 3.8
# Imagem oficial (Docker Hub): https://hub.docker.com/_/rabbitmq
# Advanced Message Queuing Protocol (AMQP).
#-------------------------------------------------------------------------------------

FROM rabbitmq:3-management
RUN apt-get update
RUN apt-get install -y curl

ENV RABBITMQ_DEFAULT_USER devel
ENV RABBITMQ_DEFAULT_PASS devel

EXPOSE 4369 5671 5672 25672 15671 15672
